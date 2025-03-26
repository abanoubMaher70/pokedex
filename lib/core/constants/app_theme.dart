import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();
  static SystemUiOverlayStyle kPrimaryOnboardingTheme =
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff1B0131),
        statusBarIconBrightness: Brightness.light,
      );

  static SystemUiOverlayStyle kPrimaryHomeTheme = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
  );
}
