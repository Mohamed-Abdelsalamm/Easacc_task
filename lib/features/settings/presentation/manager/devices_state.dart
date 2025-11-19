import 'package:flutter/material.dart';
import '../models/device_item.dart';

@immutable
sealed class DevicesState {}

final class DevicesInitial extends DevicesState {}

final class DevicesLoading extends DevicesState {}

final class DevicesLoaded extends DevicesState {
  final List<DeviceItem> devices;
  final String? selectedId;

  DevicesLoaded({required this.devices, this.selectedId});
}

final class DevicesError extends DevicesState {
  final String message;
  DevicesError(this.message);
}
