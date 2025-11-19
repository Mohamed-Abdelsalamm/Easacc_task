import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../manager/devices_cubit.dart';
import '../manager/devices_state.dart';
import 'device_dropdown.dart';

class DevicesSection extends StatelessWidget {
  const DevicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DevicesCubit>().loadDevices();

    return BlocBuilder<DevicesCubit, DevicesState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.of(context).availableNetworkDevices,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              verticalSpace(8),
              if (state is DevicesLoading)
                const Center(child: CircularProgressIndicator())
              else
                const DeviceDropdown(),
              verticalSpace(8),
              if (state is DevicesLoaded && state.selectedId != null)
                Padding(
                  padding: EdgeInsets.only(left: 8.w, bottom: 8.h),
                  child: Text(
                    '${S.of(context).selectedId}: ${state.selectedId}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.read<DevicesCubit>().refresh(),
                  child: Text(S.of(context).refresh),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
