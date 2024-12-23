import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold16White = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold24Black = GoogleFonts.elMessiri(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold20Black = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold16Black = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blackColor);

  // static TextStyle bold14Black = GoogleFonts.elMessiri(
  //     fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold20White = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold14White = GoogleFonts.elMessiri(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold12White = GoogleFonts.elMessiri(
      fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold36White = GoogleFonts.elMessiri(
      fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold20Primary = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryDark);
  static TextStyle bold24Primary = GoogleFonts.elMessiri(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryDark);
  static TextStyle bold16Primary = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryDark);
  static TextStyle regular16White = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.whiteColor);
}
