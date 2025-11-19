import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/generated/assets.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        Assets.assetsImagesSvgsArrowRight02,
        width: 24.r,
        height: 24.r,
        matchTextDirection: true,
        colorFilter: const ColorFilter.mode(
          AppColors.neutral600,
          BlendMode.srcIn,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
