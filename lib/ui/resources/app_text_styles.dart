import 'package:flutter/material.dart';

import '../widgets/size_extension.dart';

class AppCorners {
  static double sm = 3.r;
  static BorderRadius smBorder = BorderRadius.all(smRadius);
  static Radius smRadius = Radius.circular(sm);

  static double med = 5.r;
  static BorderRadius medBorder = BorderRadius.all(medRadius);
  static Radius medRadius = Radius.circular(med);

  static double lg = 10.r;
  static BorderRadius lgBorder = BorderRadius.all(
    lgRadius,
  );
  static Radius lgRadius = Radius.circular(lg);

  static double xlg = 14.r;
  static BorderRadius xlgBorder = BorderRadius.all(xlgRadius);
  static Radius xlgRadius = Radius.circular(xlg);

  static double xl2g = 20.r;
  static BorderRadius xl2gBorder = BorderRadius.all(xl2gRadius);
  static Radius xl2gRadius = Radius.circular(xl2g);
}

class Fonts {
  static const String raleway = "Raleway";
  static const String fraunces = "Fraunces";
}

class AppTextStyles {
  static const TextStyle raleway = TextStyle(
      fontFamily: Fonts.raleway, fontWeight: FontWeight.w400, height: 1);
  static const TextStyle fraunces = TextStyle(
      fontFamily: Fonts.fraunces, fontWeight: FontWeight.w400, height: 1);

  static TextStyle get h1 => fraunces.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 34.sp,
      letterSpacing: -1,
      height: 1.5);

  static TextStyle get h2 => h1.copyWith(
        fontSize: 24.sp,
        letterSpacing: -.5,
        height: 1.16,
      );
  static TextStyle get h2_20 =>
      h1.copyWith(fontSize: 20.sp, letterSpacing: -.5, height: 1.16);
  static TextStyle get h2_18 =>
      h1.copyWith(fontSize: 18.sp, letterSpacing: -.5, height: 1.16);

  static TextStyle get h3 =>
      h1.copyWith(fontSize: 14.sp, letterSpacing: -.05, height: 1.29);

  static TextStyle get h4 =>
      h1.copyWith(fontSize: 13.sp, letterSpacing: -.05, height: 1.29);

  static TextStyle get title1 => raleway.copyWith(
      fontWeight: FontWeight.bold, fontSize: 16.sp, height: 1.31);

  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.w500, fontSize: 14.sp, height: 1.36);

  static TextStyle get body1 => raleway.copyWith(
      fontWeight: FontWeight.normal, fontSize: 14.sp, height: 1.71);

  static TextStyle get body2 =>
      body1.copyWith(fontSize: 12.sp, height: 1.5, letterSpacing: .2);

  static TextStyle get body3 =>
      body1.copyWith(fontSize: 12.sp, height: 1.5, fontWeight: FontWeight.bold);

  static TextStyle get body4 => raleway.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
      );
  static TextStyle get regular_26 => raleway.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 26.sp,
      );
  static TextStyle get regular_16 => raleway.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      );
  static TextStyle get regular_14 => raleway.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      );
  static TextStyle get semi_bold_20 => raleway.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      );
  static TextStyle get bold_14 => raleway.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      );
  static TextStyle get meduim_14 => raleway.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      );
  static TextStyle get black_25 => raleway.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 25.sp,
      );
  static TextStyle get regular_12 => raleway.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
      );
}
