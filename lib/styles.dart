import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/dimen.dart';

abstract class Styles {
  /// 封面使用文字
  static const TextStyle textCover = TextStyle(fontSize: Dimen.textCoverSize,color: Colors.colorWhite);
  static const TextStyle textNormal = TextStyle(fontSize: Dimen.textNormalSize);
  static const TextStyle textStyleTitle =
      TextStyle(fontSize: Dimen.textTitleSize);
}
