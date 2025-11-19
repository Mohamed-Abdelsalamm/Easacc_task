import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easacc_flutter_task/core/components/custom_arrow_back.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final bool haveArrowBack;
  final Widget? customLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.actions,
    this.haveArrowBack = true,
    this.customLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      actionsPadding: EdgeInsets.symmetric(horizontal: 8.w),
      leading: customLeading ?? (haveArrowBack ? CustomArrowBack() : null),
      elevation: 0,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1, color: AppColors.neutral50),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(51.h);
}
