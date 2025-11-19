import 'dart:async';
import 'package:easacc_flutter_task/features/settings/presentation/models/device_item.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothScanner {
  Future<List<DeviceItem>> scan() async {
    final devices = <DeviceItem>[];

    // Check if Bluetooth is supported
    if (!await FlutterBluePlus.isSupported) return devices;

    // Check if Bluetooth adapter is on
    final adapterState = await FlutterBluePlus.adapterState.first;
    if (adapterState != BluetoothAdapterState.on) {
      // Try to turn on Bluetooth (on Android)
      try {
        await FlutterBluePlus.turnOn();
        // Wait a moment for the adapter to turn on
        await Future.delayed(const Duration(seconds: 1));
      } catch (e) {
        // If we can't turn on Bluetooth, return empty list
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
      
      // Wait for scan to complete
      await Future.delayed(const Duration(seconds: 6));
    } catch (e) {
      // Silently catch scanning errors
    } finally {
      await FlutterBluePlus.stopScan();
      await sub?.cancel();
    }

    return devices;
  }
}
