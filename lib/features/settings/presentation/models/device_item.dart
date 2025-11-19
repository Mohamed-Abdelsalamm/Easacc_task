enum DeviceType { wifi, bluetooth }

class DeviceItem {
  final String id;
  final String name;
  final DeviceType type;

  DeviceItem({required this.id, required this.name, required this.type});
}
