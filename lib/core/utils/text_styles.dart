import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  TextStyles._();

  static final normalTextStyle16 = TextStyle(
    fontFamily:
        GoogleFonts.poppins(fontSize: 16, color: Colors.white).fontFamily,
  );
  static final normalTextStyle18 = TextStyle(
    fontFamily: GoogleFonts.poppins(fontSize: 18).fontFamily,
  );
  static final normalTextStyle22 = TextStyle(
    fontFamily: GoogleFonts.poppins(fontSize: 22).fontFamily,
  );

  static final textStyle12 = const TextStyle(fontSize: 12);
  static final textStyle14 = const TextStyle(fontSize: 14);
  static final textStyle16 = const TextStyle(fontSize: 16);
  static final textStyle18 = const TextStyle(fontSize: 18);
  static final textStyle20 = const TextStyle(fontSize: 20);
}
