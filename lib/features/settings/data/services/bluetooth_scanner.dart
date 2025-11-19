import 'dart:async';
import 'package:easacc_flutter_task/features/settings/presentation/models/device_item.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothScanner {
  Future<List<DeviceItem>> scan() async {
    final devices = <DeviceItem>[];

    if (!await FlutterBluePlus.isSupported) return devices;

    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      try {
        await FlutterBluePlus.turnOn();
        await Future.delayed(const Duration(seconds: 1));
      } catch (e) {
        return devices;
      }
    }

    StreamSubscription? sub;

    try {
      sub = FlutterBluePlus.scanResults.listen((results) {
        for (final r in results) {
          final id = r.device.remoteId.str;

          if (!devices.any((d) => d.id == id)) {
            final name = r.device.platformName.isNotEmpty
                ? r.device.platformName
                : r.advertisementData.advName.isNotEmpty
                    ? r.advertisementData.advName
                    : 'Unknown BLE';

            devices.add(
              DeviceItem(
                id: id,
                name: '$name (BLE)',
                type: DeviceType.bluetooth,
              ),
            );
          }
        }
      });

      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 6));
      
      await Future.delayed(const Duration(seconds: 6));
    } catch (e) {
      // Handle scan errors if necessary
    } finally {
      await FlutterBluePlus.stopScan();
      await sub?.cancel();
    }

    return devices;
  }
}
