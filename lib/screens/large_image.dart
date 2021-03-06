import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

/// 创建图片页面
class _LargePage extends StatelessWidget {
  /// 图片地址
  final String url;

  const _LargePage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaY: 14, sigmaX: 24),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        //不同的透明度
                        Color(0x8A000000),
                        Color(0x42000000),
                        Color(0x73000000),
                        Color(0xCC000000),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: url,
                    placeholder: (context, url) => CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(CupertinoIcons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

/// 补间动画
Tween<RelativeRect> _createTween(BuildContext context) {
  var windowSize = MediaQuery.of(context).size;
  var box = context.findRenderObject() as RenderBox;
  var rect = box.localToGlobal(Offset.zero) & box.size;
  var relativeRect = RelativeRect.fromSize(rect, windowSize);

  return RelativeRectTween(
    begin: relativeRect,
    end: RelativeRect.fill,
  );
}

/// 全屏大图 width/height = 1:1
Route toLargeImageRoute(BuildContext parentContext, String url) =>
    PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaruAnimation) =>
            _LargePage(url: url),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var rectAnimation = _createTween(parentContext)
              .chain(CurveTween(curve: Curves.ease))
              .animate(animation);
          return Stack(children: [
            PositionedTransition(rect: rectAnimation, child: child)
          ]);
        });
