import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';
import 'package:easacc_flutter_task/generated/assets.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.onChanged,
    this.enabled = true,
    this.unFocusOnTapOutside,
    this.isAutoValidate,
    this.onTap,
    this.maxLines = 1,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool? unFocusOnTapOutside;
  final bool? isAutoValidate;
  final VoidCallback? onTap;
  final int? maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.isAutoValidate == true
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onTapOutside: widget.unFocusOnTapOutside == true
          ? (event) {
              FocusScope.of(context).unfocus();
            }
          : null,
      controller: widget.controller,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      errorBuilder: (context, errorText) {
        return _buildErrorMessage(errorText, context);
      },
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: AppColors.neutral900,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        isCollapsed: true,
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: widget.prefixIcon != null ? 0 : 16.w,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(right: 12.0.w, left: 8.0.w),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: (widget.suffixIcon != null || widget.isPassword)
            ? Padding(
                padding: EdgeInsets.only(left: 12.0.w, right: 8.0.w),
                child:
                    widget.suffixIcon ??
                    (widget.isPassword ? _buildShowPasswordSuffix() : null),
              )
            : null,
      ),
    );
  }

  Widget _buildShowPasswordSuffix() {
    return IconButton(
      splashRadius: 20,
      icon: SvgPicture.asset(
        width: 16.r,
        height: 16.r,
        _obscureText
            ? Assets.assetsImagesSvgsViewOff
            : Assets.assetsImagesSvgsViewIcon,
        colorFilter: ColorFilter.mode(AppColors.neutral400, BlendMode.srcIn),
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  Row _buildErrorMessage(String errorText, BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.assetsImagesSvgsAlertCircle),
        horizontalSpace(4),
        Expanded(
          child: Text(
            errorText,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.error),
          ),
        ),
      ],
    );
  }
}
