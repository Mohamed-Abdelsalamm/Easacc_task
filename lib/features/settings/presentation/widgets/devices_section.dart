import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../manager/devices_cubit.dart';
import '../manager/devices_state.dart';
import 'device_dropdown.dart';

class DevicesSection extends StatefulWidget {
  const DevicesSection({super.key});

  @override
  State<DevicesSection> createState() => _DevicesSectionState();
}

class _DevicesSectionState extends State<DevicesSection> {
  @override
  void initState() {
       context.read<DevicesCubit>().loadDevices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesCubit, DevicesState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(S.of(context).availableNetworkDevices),
              verticalSpace(8),
              const DeviceDropdown(),
              verticalSpace(8),
              if (state is DevicesLoaded && state.selectedId != null)
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w, bottom: 8.0.h),
                  child: Text(
                    '${S.of(context).selectedId}: ${state.selectedId}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.read<DevicesCubit>().refresh(),
                    child: Text(S.of(context).refresh),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
