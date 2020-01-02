import 'package:flutter/cupertino.dart';
import 'package:thirteen/styles.dart';

abstract class Themes {
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: Styles.colorPrimary,
    // scaffoldBackgroundColor: Styles.colorPrimaryDark,
  );

  static const CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: Styles.colorPrimary,
  );
}
