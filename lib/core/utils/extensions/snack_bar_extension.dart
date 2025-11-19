import 'package:flutter/material.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';

extension SnackBarExtension on BuildContext {
  void showCustomSnackBar(
    String content, {
    int duration = 2,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? AppColors.primary500,
        content: Text(
          content,
          style: Theme.of(this).textTheme.bodySmall?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        duration: Duration(seconds: duration),
      ),
    );
  }
}
