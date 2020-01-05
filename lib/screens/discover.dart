import 'package:flutter/cupertino.dart';

import 'package:thirteen/widgets/banner.dart';

import 'package:thirteen/styles.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          BannerWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(const IconData(0xf35c,
                      fontFamily: CupertinoIcons.iconFont,
                      fontPackage: CupertinoIcons.iconFontPackage)),
                  Text('每日推荐', style: Styles.small_normal_10),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(CupertinoIcons.music_note),
                  Text('歌单', style: Styles.small_normal_10),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(const IconData(0xf2b5,
                      fontFamily: CupertinoIcons.iconFont,
                      fontPackage: CupertinoIcons.iconFontPackage)),
                  Text('排行', style: Styles.small_normal_10),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(const IconData(0xf35c,
                      fontFamily: CupertinoIcons.iconFont,
                      fontPackage: CupertinoIcons.iconFontPackage)),
                  Text('电台', style: Styles.small_normal_10),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(const IconData(0xf380,
                      fontFamily: CupertinoIcons.iconFont,
                      fontPackage: CupertinoIcons.iconFontPackage)),
                  Text('直播', style: Styles.small_normal_10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
