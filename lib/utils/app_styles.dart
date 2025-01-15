import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppStyles {
  static TextStyle normal16gray =
      GoogleFonts.inter(color: AppColor.gray, fontSize: 16);

  static TextStyle bold20black = GoogleFonts.inter(
      color: AppColor.black, fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle bold24black = GoogleFonts.inter(
      color: AppColor.black, fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle bold14black = GoogleFonts.inter(
      color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w700);
    static TextStyle normal16black = GoogleFonts.inter(
      color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle bold16black = GoogleFonts.inter(
      color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle normal20white = GoogleFonts.inter(
      color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle normal16white = GoogleFonts.inter(
      color: AppColor.white, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle normal14white = GoogleFonts.inter(
      color: AppColor.white, fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle bold24white = GoogleFonts.inter(
      color: AppColor.white, fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle bold20white = GoogleFonts.inter(
      color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle normal12grey = GoogleFonts.inter(
      color: Color(0xffA0A0A0), fontSize: 12, fontWeight: FontWeight.w500);
}
