import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static final textStyle16 = const TextStyle(fontSize: 16);
  static final textStyle18 = const TextStyle(fontSize: 18);
  static final textStyle22 = const TextStyle(fontSize: 22);

  static final pixelFont16 = TextStyle(
    fontFamily:
        GoogleFonts.pressStart2p(fontSize: 16, color: Colors.black).fontFamily,
  );
  static final pixelFont18 = TextStyle(
    fontFamily:
        GoogleFonts.pressStart2p(fontSize: 18, color: Colors.black).fontFamily,
  );
  static final pixelFont20 = TextStyle(
    fontFamily:
        GoogleFonts.pressStart2p(fontSize: 20, color: Colors.black).fontFamily,
  );
}
