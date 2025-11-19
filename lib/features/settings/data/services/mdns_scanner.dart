import 'package:easacc_flutter_task/features/settings/presentation/models/device_item.dart';
import 'package:multicast_dns/multicast_dns.dart';

class MdnsScanner {
  final client = MDnsClient();

  final serviceTypes = [
    '_ipp._tcp.local',
    '_printer._tcp.local',
    '_http._tcp.local',
  ];

  Future<List<DeviceItem>> scan() async {
    final devices = <DeviceItem>[];

    try {
      await client.start();

      for (final service in serviceTypes) {
        await for (final ptr in client.lookup<PtrResourceRecord>(
          ResourceRecordQuery.serverPointer(service),
        ).timeout(const Duration(seconds: 3))) {

          await for (final srv in client.lookup<SrvResourceRecord>(
            ResourceRecordQuery.service(ptr.domainName),
          ).timeout(const Duration(seconds: 2))) {

            String? address;

            await for (final ip in client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv4(srv.target),
            ).timeout(const Duration(seconds: 2))) {
              address = ip.address.address;
            }

            final name = ptr.domainName.split('.').first;

            devices.add(
              DeviceItem(
                id: '${srv.target}|${srv.port}',
                name: address != null
                    ? '$name ($address:${srv.port})'
                    : '$name (port: ${srv.port})',
                type: DeviceType.wifi,
              ),
            );
          }
        }
      }
    } catch (_) {}

    client.stop();
    return devices;
  }
}
