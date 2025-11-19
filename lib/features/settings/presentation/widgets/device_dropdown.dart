import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../manager/devices_cubit.dart';
import '../manager/devices_state.dart';

class DeviceDropdown extends StatelessWidget {
  const DeviceDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesCubit, DevicesState>(builder: (context, state) {
      if (state is DevicesLoading || state is DevicesInitial) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is DevicesError) {
        // Translate error message key to localized string
        String errorMessage = state.message;
        if (state.message == 'permissionsRequiredMessage') {
          errorMessage = S.of(context).permissionsRequiredMessage;
        } else if (state.message == 'noDevicesFoundMessage') {
          errorMessage = S.of(context).noDevicesFoundMessage;
        } else if (state.message.startsWith('failedToDiscoverDevices')) {
          errorMessage = '${S.of(context).failedToDiscoverDevices}: ${state.message.replaceFirst('failedToDiscoverDevices: ', '')}';
        }
        return Center(child: Text(errorMessage));
      }

      if (state is DevicesLoaded) {
        final devices = state.devices;
        final selectedId = state.selectedId;

        return DropdownButtonFormField<String>(
          // ignore: deprecated_member_use
          value: selectedId,
          items: devices
              .map((d) => DropdownMenuItem(value: d.id, child: Text(d.name)))
              .toList(),
          onChanged: (val) {
            if (val != null) context.read<DevicesCubit>().selectDevice(val);
          },
          decoration: const InputDecoration(border: OutlineInputBorder()),
        );
      }

      return const SizedBox.shrink();
    });
  }
}
