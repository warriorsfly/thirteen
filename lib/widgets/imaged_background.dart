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
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaY: 14, sigmaX: 24),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // CupertinoColors.inactiveGray,
                    // CupertinoColors.extraLightBackgroundGray,
                    // CupertinoColors.lightBackgroundGray,
                    // CupertinoColors.darkBackgroundGray,
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
