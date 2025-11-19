import 'package:easacc_flutter_task/features/settings/data/services/bluetooth_scanner.dart';
import 'package:easacc_flutter_task/features/settings/data/services/mdns_scanner.dart';
import 'package:easacc_flutter_task/features/settings/data/services/permission_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  final PermissionService permissionService;
  final MdnsScanner mdnsScanner;
  final BluetoothScanner bluetoothScanner;

  DevicesCubit({
    required this.permissionService,
    required this.mdnsScanner,
    required this.bluetoothScanner,
  }) : super(DevicesInitial());

  Future<void> loadDevices() async {
    emit(DevicesLoading());

    try {
      final granted = await permissionService.requestAll();
      if (!granted) {
        emit(DevicesError('permissionsRequiredMessage'));
        return;
      }

      final results = await Future.wait([
        mdnsScanner.scan(),
        bluetoothScanner.scan(),
      ]);

      final mdns = results[0];
      final ble = results[1];

      final merged = [...mdns];

      for (final d in ble) {
        if (!merged.any((m) => m.id == d.id)) {
          merged.add(d);
        }
      }

      if (merged.isEmpty) {
        emit(DevicesError('noDevicesFoundMessage'));
      } else {
        emit(DevicesLoaded(devices: merged, selectedId: merged.first.id));
      }
    } catch (e) {
      emit(DevicesError('failedToDiscoverDevices: $e'));
    }
  }

  void selectDevice(String id) {
    final s = state;
    if (s is DevicesLoaded) {
      emit(DevicesLoaded(devices: s.devices, selectedId: id));
    }
  }

  Future<void> refresh() async => loadDevices();

  @override
  Future<void> close() {
    mdnsScanner.client.stop();
    return super.close();
  }
}
