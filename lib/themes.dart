import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';

abstract class Themes {
  static const CupertinoThemeData dark = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.colorPrimary,
    // scaffoldBackgroundColor: Styles.colorPrimaryDark,
  );

  static const CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.colorPrimary,
  );

  static const CupertinoThemeData cupertinoDark = CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.colorWhite,
      textTheme: CupertinoTextThemeData(
        primaryColor: Colors.colorWhite,
      ));
}
