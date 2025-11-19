import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.borderColor,
    this.borderWidth = 0.0,
    this.buttonColor,
    this.isLoading = false,
    this.isDisabled = false,
    this.svgImage,
    this.textColor,
    this.followTextDirection,
  });

  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final double borderWidth;
  final bool isLoading;
  final bool isDisabled;
  final String? svgImage;
  final Color? textColor;
  final bool? followTextDirection;

  @override
  Widget build(BuildContext context) {
    final Color effectiveButtonColor = isDisabled
        ? AppColors.neutral300
        : buttonColor ?? AppColors.primary500;

    final Color effectiveTextColor = isDisabled
        ? AppColors.neutral700
        : textColor ?? AppColors.white;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 44.h,
      child: ElevatedButton(
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: isLoading
              ? AppColors.primary500
              : AppColors.neutral300,
          backgroundColor: effectiveButtonColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
            side: BorderSide(
              color:
                  borderColor ??
                  (isDisabled ? Colors.transparent : AppColors.primary500),
              width: borderWidth,
            ),
          ),
          elevation: 0,
        ),
        child: Center(
          child: isLoading
              ? SpinKitThreeBounce(color: effectiveTextColor, size: 20.w)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style:
                          textStyle ??
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: effectiveTextColor,
                          ),
                      textAlign: TextAlign.center,
                    ),

                    if (svgImage != null) ...[
                      horizontalSpace(8),
                      SvgPicture.asset(
                        svgImage!,
                        width: 16.w,
                        height: 16.w,
                        colorFilter: ColorFilter.mode(
                          effectiveTextColor,
                          BlendMode.srcIn,
                        ),
                        matchTextDirection: followTextDirection ?? true,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
