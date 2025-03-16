import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static final textStyle16 = const TextStyle(color: Colors.white, fontSize: 16);

  static final pixelFont20 = TextStyle(
    fontFamily: GoogleFonts.pressStart2p().fontFamily,
    color: Colors.white,
    fontSize: 20,
  );
}
