import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';

final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primary500,
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Cairo',

  /// ================= APP BAR =================
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    foregroundColor: AppColors.neutral900,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontFamily: "Cairo",
      fontWeight: FontWeight.w700,
      color: AppColors.neutral950,
    ),
  ),

  /// ================= INPUT FIELDS =================
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral400,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 16.w, minHeight: 16.w),
    suffixIconConstraints: BoxConstraints(minWidth: 16.w, minHeight: 16.w),
    filled: true,
    fillColor: AppColors.neutral50,
    prefixIconColor: AppColors.neutral400,
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.primary400, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
  ),

  ///==================DIVIDERS==================
  dividerTheme: DividerThemeData(
    color: AppColors.neutral50,
    thickness: 1.h,
    space: 1.h,
  ),

  /// ================= BOTTOM SHEET =================
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
    modalBackgroundColor: AppColors.white,
  ),

  /// ================= NAVIGATION BAR =================
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedLabelStyle: TextStyle(
      fontSize: 10.sp,
      height: 1.4,
      fontWeight: FontWeight.w600,
      color: AppColors.primary500,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      height: 1.4,
      color: AppColors.neutral600,
    ),
    elevation: 0,
  ),

  /// ================= DIALOGS =================
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutral900,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral800,
    ),
  ),

  /// ================= TEXT THEMES =================
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral900,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral900,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.neutral800,
    ),
    headlineLarge: TextStyle(
      fontSize: 33.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutral900,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutral900,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.neutral900,
    ),
    displayLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral900,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral900,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.neutral900,
    ),
  ),

  /// ================= COLOR SCHEME =================
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary500,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary500,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.neutral50,
    onSurface: AppColors.neutral900,
    tertiary: AppColors.tertiary500,
    onTertiary: AppColors.white,
    inverseSurface: AppColors.neutral100,
    onInverseSurface: AppColors.neutral900,
  ),
);
