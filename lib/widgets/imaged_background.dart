import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class ImagedBackground extends StatelessWidget {
  final String url;
  ImagedBackground({@required this.url});
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            url,
            fit: BoxFit.cover,
            gaplessPlayback: true,
            // cacheWidth: 404,
            // cacheHeight: 404,
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
