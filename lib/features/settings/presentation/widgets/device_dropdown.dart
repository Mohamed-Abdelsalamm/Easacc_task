import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../manager/devices_cubit.dart';
import '../manager/devices_state.dart';

class DeviceDropdown extends StatelessWidget {
  const DeviceDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesCubit, DevicesState>(
      builder: (context, state) {
        if (state is DevicesLoading || state is DevicesInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DevicesError) {
          final errorMessage = _getLocalizedError(context, state.message);
          return Center(child: Text(errorMessage));
        }

        if (state is DevicesLoaded) {
          final devices = state.devices;
          final selectedId = state.selectedId;

          if (devices.isEmpty) {
            return Center(child: Text(S.of(context).noDevicesFoundMessage));
          }

          return DropdownButtonFormField<String>(
            value: selectedId,
            items: devices
                .map((d) => DropdownMenuItem(
                      value: d.id,
                      child: Text(d.name),
                    ))
                .toList(),
            onChanged: (val) {
              if (val != null) {
                context.read<DevicesCubit>().selectDevice(val);
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  String _getLocalizedError(BuildContext context, String messageKey) {
    switch (messageKey) {
      case 'permissionsRequiredMessage':
        return S.of(context).permissionsRequiredMessage;
      case 'noDevicesFoundMessage':
        return S.of(context).noDevicesFoundMessage;
      default:
        if (messageKey.startsWith('failedToDiscoverDevices')) {
          final detail =
              messageKey.replaceFirst('failedToDiscoverDevices: ', '');
          return '${S.of(context).failedToDiscoverDevices}: $detail';
        }
        return messageKey;
    }
  }
}
