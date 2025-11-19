import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multicast_dns/multicast_dns.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../models/device_item.dart';
import 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit() : super(DevicesInitial());

  final _mdns = MDnsClient();

  Future<bool> _handlingPermissions() async {
    var locationStatus = await Permission.locationWhenInUse.status;
    if (!locationStatus.isGranted) {
      locationStatus = await Permission.locationWhenInUse.request();
      if (!locationStatus.isGranted) {
        return false;
      }
    }
    
    if (!await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      await Permission.location.request();
      if (!await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        return false;
      }
    }
    
    var bluetoothScanStatus = await Permission.bluetoothScan.status;
    if (!bluetoothScanStatus.isGranted) {
      bluetoothScanStatus = await Permission.bluetoothScan.request();
      if (!bluetoothScanStatus.isGranted) {
        return false;
      }
    }
    
    var bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    if (!bluetoothConnectStatus.isGranted) {
      bluetoothConnectStatus = await Permission.bluetoothConnect.request();
      if (!bluetoothConnectStatus.isGranted) {
        return false;
      }
    }
    
    return true;
  }

  Future<List<DeviceItem>> _discoverMdns() async {
    final results = <DeviceItem>[];
    try {
      await _mdns.start();

      final serviceTypes = ['_ipp._tcp', '_printer._tcp', '_http._tcp'];

      for (final service in serviceTypes) {
        try {
          await _mdns
              .lookup<PtrResourceRecord>(
                ResourceRecordQuery.serverPointer('$service.local'),
              )
              .timeout(const Duration(seconds: 3))
              .forEach((ptr) async {
                final instanceName = ptr.domainName;

                try {
                  await _mdns
                      .lookup<SrvResourceRecord>(
                        ResourceRecordQuery.service(instanceName),
                      )
                      .timeout(const Duration(seconds: 2))
                      .forEach((srv) async {
                        final target = srv.target;
                        final port = srv.port;
                        String? address;

                        try {
                          await _mdns
                              .lookup<IPAddressResourceRecord>(
                                ResourceRecordQuery.addressIPv4(target),
                              )
                              .timeout(const Duration(seconds: 2))
                              .forEach((addr) {
                                address = addr.address.address;
                              });
                        } catch (_) {}

                        final id = '$service|$target|$port';
                        final name = instanceName.replaceAll(
                          '.$service.local',
                          '',
                        );
                        final deviceName = address != null
                            ? '$name ($address:$port)'
                            : '$name (port: $port)';
                        results.add(
                          DeviceItem(
                            id: id,
                            name: deviceName,
                            type: DeviceType.wifi,
                          ),
                        );
                      });
                } catch (_) {}
              });
        } catch (_) {}
      }

      _mdns.stop();
    } catch (_) {}

    return results;
  }

  Future<List<DeviceItem>> _scanBle() async {
    final found = <DeviceItem>[];
    StreamSubscription? subscription;

    try {
      final locationStatus = await Permission.locationWhenInUse.status;
      if (!locationStatus.isGranted) {
        return found;
      }

      if (await FlutterBluePlus.isSupported == false) {
        return found;
      }


      var adapterState = await FlutterBluePlus.adapterState.first;
      if (adapterState != BluetoothAdapterState.on) {

        try {
          if (await FlutterBluePlus.isSupported) {
            await FlutterBluePlus.turnOn();

            await Future.delayed(const Duration(seconds: 2));
            adapterState = await FlutterBluePlus.adapterState.first;
            if (adapterState != BluetoothAdapterState.on) {
              return found;
            }
          }
        } catch (_) {
          return found;
        }
      }

      subscription = FlutterBluePlus.scanResults.listen((results) {
        for (final r in results) {
          final id = r.device.remoteId.str;
          final name = r.device.platformName.isNotEmpty
              ? r.device.platformName
              : (r.advertisementData.advName.isNotEmpty
                    ? r.advertisementData.advName
                    : 'Unknown BLE');

          if (!found.any((d) => d.id == id)) {
            found.add(
              DeviceItem(
                id: id,
                name: '$name (BLE)',
                type: DeviceType.bluetooth,
              ),
            );
          }
        }
      });

      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 8));

      await Future.delayed(const Duration(seconds: 9));
    } catch (_) {
    } finally {
      try {
        await FlutterBluePlus.stopScan();
      } catch (_) {}

      try {
        await subscription?.cancel();
      } catch (_) {}
    }

    return found;
  }

  Future<void> loadDevices() async {
    emit(DevicesLoading());
    try {

      final permissionsGranted = await _handlingPermissions();
      
      if (!permissionsGranted) {
        emit(
          DevicesError(
            'permissionsRequiredMessage',
          ),
        );
        return;
      }

      final results = await Future.wait([_discoverMdns(), _scanBle()]);

      final mdnsList = results[0];
      final bleList = results[1];

      final merged = <DeviceItem>[];
      for (final d in mdnsList) {
        merged.add(d);
      }
      for (final b in bleList) {
        if (!merged.any((m) => m.id == b.id || m.name == b.name)) {
          merged.add(b);
        }
      }

      if (merged.isEmpty) {
        emit(
          DevicesError(
            'noDevicesFoundMessage',
          ),
        );
      } else {
        emit(DevicesLoaded(devices: merged, selectedId: merged.first.id));
      }
    } catch (e) {
      emit(DevicesError('failedToDiscoverDevices: ${e.toString()}'));
    }
  }

  Future<void> refresh() async {
    await loadDevices();
  }

  void selectDevice(String id) {
    final current = state;
    if (current is DevicesLoaded) {
      emit(DevicesLoaded(devices: current.devices, selectedId: id));
    }
  }

  @override
  Future<void> close() {
    _mdns.stop();
    return super.close();
  }
}
