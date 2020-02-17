import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/dimen.dart';

abstract class Styles {
  /// 封面使用文字
  static const TextStyle textStyleCover =
      TextStyle(fontSize: Dimen.textSizeSmall, color: Colors.color90White);

  static const TextStyle textNormal = TextStyle(fontSize: Dimen.textSizeNormal);
  static const TextStyle textStyleTitle =
      TextStyle(fontSize: Dimen.textSizeLarge);

  static const TextStyle textStyleAlbumTitleDark =
      TextStyle(fontSize: Dimen.textAlbumTitleSize, color: Colors.colorWhite);


  static const TextStyle textStyleCreator =
      TextStyle(fontSize: Dimen.textSizeNormal, color: Colors.color90White);

   static const TextStyle textStyleAlbumDescription =
      TextStyle(fontSize: Dimen.textSizeSmall, color: Colors.color90White);

}
