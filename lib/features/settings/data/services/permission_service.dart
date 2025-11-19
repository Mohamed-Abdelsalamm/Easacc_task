import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestAll() async {
    // Request location permission first (required for BLE scanning on both platforms)
    final locationStatus = await Permission.locationWhenInUse.status;
    if (!locationStatus.isGranted) {
      final locationResult = await Permission.locationWhenInUse.request();
      if (!locationResult.isGranted) {
        return false;
      }
    }

    // On Android 12+ (API 31+), request Bluetooth permissions
    if (Platform.isAndroid) {
      final bluetoothScanStatus = await Permission.bluetoothScan.status;
      if (!bluetoothScanStatus.isGranted) {
        final scanResult = await Permission.bluetoothScan.request();
        if (!scanResult.isGranted) {
          return false;
        }
      }

      final bluetoothConnectStatus = await Permission.bluetoothConnect.status;
      if (!bluetoothConnectStatus.isGranted) {
        final connectResult = await Permission.bluetoothConnect.request();
        if (!connectResult.isGranted) {
          return false;
        }
      }
    }

    // On iOS, request Bluetooth permission
    if (Platform.isIOS) {
      final bluetoothStatus = await Permission.bluetooth.status;
      if (!bluetoothStatus.isGranted) {
        final bluetoothResult = await Permission.bluetooth.request();
        if (!bluetoothResult.isGranted) {
          return false;
        }
      }
    }

    return true;
  }
}
