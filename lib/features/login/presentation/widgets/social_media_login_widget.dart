import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/generated/assets.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaLoginWidget extends StatelessWidget {
  const SocialMediaLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          onPressed: () {},
          assetPath: Assets.assetsImagesSvgsGoogleIcon,
        ),
        horizontalSpace(30),
        Text(
          S.of(context).or,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF9E9E9E),
          ),
        ),
        horizontalSpace(20),
        _buildIconButton(
          onPressed: () {},
          assetPath: Assets.assetsImagesSvgsFacebookLogin,
        ),
      ],
    );
  }

  IconButton _buildIconButton({
    required VoidCallback? onPressed,
    required String assetPath,
  }) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: const CircleBorder(side: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(assetPath, width: 24.w, height: 24.h),
    );
  }
}
