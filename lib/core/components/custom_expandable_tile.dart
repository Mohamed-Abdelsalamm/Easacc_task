import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/core/utils/helper/spacing.dart';

class CustomExpandableTile extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;

  const CustomExpandableTile({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  @override
  State<CustomExpandableTile> createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bG,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _toggle,
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral950,
                          ),
                    ),
                  ),
                  horizontalSpace(12.w),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: isExpanded ? 0 : 0.5, // 180 degrees
                    child: Icon(
                      Icons.keyboard_arrow_up_sharp,
                      color: AppColors.neutral600,
                      size: 24.r,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Expanded content
          ClipRect(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              heightFactor: isExpanded ? 1.0 : 0.0,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: isExpanded ? 1.0 : 0.0,
                  curve: Curves.easeIn,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
