import 'package:flutter/material.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errMessage,
    this.onPressed,
  });
  final String errMessage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(20),
        errMessage == "No Internet Connection"
            ? Icon(
                Icons.signal_wifi_statusbar_connected_no_internet_4,
                size: 50,
                color: AppColors.neutral300,
              )
            : const Icon(Icons.error_outline, color: AppColors.error, size: 50),
        verticalSpace(30),
        Text(errMessage),
        verticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).retry),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.refresh, color: AppColors.primary500),
            ),
          ],
        ),
      ],
    );
  }
}
