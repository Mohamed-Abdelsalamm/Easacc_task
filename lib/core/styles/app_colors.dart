import 'package:flutter/material.dart';


class AppColors {
  AppColors._();
  // === PRIMARY COLOR SCALE ===
  static const Color primary50 = Color(0xFFE7E9FE);
  static const Color primary100 = Color(0xFFCED3FD);
  static const Color primary200 = Color(0xFF9EA7FA);
  static const Color primary300 = Color(0xFF6D7BF8);
  static const Color primary400 = Color(0xFF3D4FF5);
  static const Color primary500 = Color(0xFF2A3EF4);
  static const Color primary600 = Color(0xFF0A1CC2);
  static const Color primary700 = Color(0xFF071592);
  static const Color primary800 = Color(0xFF050E61);
  static const Color primary900 = Color(0xFF020731);
  static const Color primary950 = Color(0xFF010418);

  // === SECONDARY COLOR SCALE ===
  static const Color secondary50 = Color(0xFFECEDF8);
  static const Color secondary100 = Color(0xFFD9DAF2);
  static const Color secondary200 = Color(0xFFB3B5E5);
  static const Color secondary300 = Color(0xFF8E90D7);
  static const Color secondary400 = Color(0xFF686BCA);
  static const Color secondary500 = Color(0xFF0E0F28);
  static const Color secondary600 = Color(0xFF353897);
  static const Color secondary700 = Color(0xFF282A71);
  static const Color secondary800 = Color(0xFF1A1C4C);
  static const Color secondary900 = Color(0xFF0D0E26);
  static const Color secondary950 = Color(0xFF070713);

  // === NEUTRALS ===
  static const Color neutral50 = Color(0xFFF2F2F2);
  static const Color neutral100 = Color(0xFFE6E6E6);
  static const Color neutral200 = Color(0xFFCCCCCC);
  static const Color neutral300 = Color(0xFFB3B3B3);
  static const Color neutral400 = Color(0xFF999999);
  static const Color neutral500 = Color(0xFF000000);
  static const Color neutral600 = Color(0xFF666666);
  static const Color neutral700 = Color(0xFF4D4D4D);
  static const Color neutral800 = Color(0xFF333333);
  static const Color neutral900 = Color(0xFF1A1A1A);
  static const Color neutral950 = Color(0xFF0D0D0D);

  // === TERTIARY ===
  static const Color tertiary50 = Color(0xFFF3F4FF);
  static const Color tertiary100 = Color(0xFFDDDEEE);
  static const Color tertiary200 = Color(0xFFBABDDE);
  static const Color tertiary300 = Color(0xFF989BCD);
  static const Color tertiary400 = Color(0xFF757ABD);
  static const Color tertiary500 = Color(0xFFE4E5F2);
  static const Color tertiary600 = Color(0xFF42478A);
  static const Color tertiary700 = Color(0xFF323567);
  static const Color tertiary800 = Color(0xFF212445);
  static const Color tertiary900 = Color(0xFF111222);
  static const Color tertiary950 = Color(0xFF080911);

  //=== OTHER COLORS ===
  static const Color success = Color(0xFF4CD964);
  static const Color success500 = Color(0xFF0BB83F);
  static const Color warning = Color(0xFFFF9500);
  static const Color error = Color(0xFFC00000);
  static const Color error500 = Color(0xFFD32121);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color bG = Color(0xFFFAFAFA);
  static const Color yellow = Color(0xFFF6B131);
  static const Color yellow500 = Color(0xFFFFD633);
  static const Color warn800 = Color(0xFF665200);
}

class LightAppColors {
  LightAppColors._();

  static const Color primaryColor = AppColors.primary500;
  static const Color secondaryColor = AppColors.secondary500;
  static const Color backgroundColor = AppColors.neutral50;
  static const Color textColor = AppColors.neutral900;
}

class DarkAppColors {
  DarkAppColors._();

  static const Color primaryColor = AppColors.primary200;
  static const Color secondaryColor = AppColors.secondary200;
  static const Color backgroundColor = AppColors.neutral900;
  static const Color textColor = AppColors.white;
}
