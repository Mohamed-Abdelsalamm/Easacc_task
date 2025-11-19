import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestAll() async {
    final locationStatus = await Permission.locationWhenInUse.status;
    if (!locationStatus.isGranted) {
      final locationResult = await Permission.locationWhenInUse.request();
      if (!locationResult.isGranted) {
        return false;
      }
    }

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
