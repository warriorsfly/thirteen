import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/styles.dart';

/// 封面控件
class CoverWidget extends StatelessWidget {
  /// 图片地址
  final String url;

  /// 播放量
  final String playCount;

  /// 圆角
  final double radius;

  const CoverWidget(
      {Key key,
      @required this.url,
      @required this.playCount,
      this.radius = Dimen.radiusNormal})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Icon(CupertinoIcons.clear),
              width: Dimen.avatarSizeNormal,
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.all(Dimen.paddingSmall),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.play_arrow,
                      size: Dimen.textSizeMiddle,
                      color: Colors.colorWhite,
                    ),
                    Text(
                      playCount,
                      style: Styles.textStyleCover,
                    ),
                  ],
                )))
      ],
    );
  }
}
