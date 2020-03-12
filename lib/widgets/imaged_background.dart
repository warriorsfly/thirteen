import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class ImagedBackground extends StatelessWidget {
  final String url;
  ImagedBackground({@required this.url});
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.cover,
            useOldImageOnUrlChange: true,
            imageUrl: url,
            // placeholder: (context, url) => CupertinoActivityIndicator(),
            // errorWidget: (context, url, error) => Icon(CupertinoIcons.clear),
          ),
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
        ],
      );
}
