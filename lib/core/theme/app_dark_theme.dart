import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary400,
  scaffoldBackgroundColor: AppColors.neutral900,
  fontFamily: 'Cairo',

  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.neutral900,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.neutral900,
    surfaceTintColor: AppColors.neutral900,
    modalBackgroundColor: AppColors.neutral900,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: AppColors.primary400,
      size: 24.r,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.neutral400,
      size: 24.r,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    backgroundColor: AppColors.neutral950,
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral400,
    ),
    filled: true,
    fillColor: AppColors.neutral800,
    prefixIconColor: AppColors.neutral400,
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: AppColors.primary400),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.neutral900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral100,
    ),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral100,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral100,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral200,
    ),
    headlineLarge: TextStyle(
      fontSize: 33.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral50,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral100,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral200,
    ),
  ),

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary400,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary400,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.neutral900,
    onSurface: AppColors.white,
    inverseSurface: AppColors.neutral100,
    onInverseSurface: AppColors.neutral950,
    tertiary: AppColors.tertiary400,
    onTertiary: AppColors.white,
  ),
);
