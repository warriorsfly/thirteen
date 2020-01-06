import 'package:flutter/cupertino.dart';
import 'package:thirteen/themes.dart';

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
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: Styles.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf35c,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Styles.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('每日推荐', style: Styles.small_normal),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: Styles.colorPrimaryDark,
                        child: Icon(
                          CupertinoIcons.music_note,
                          color: Styles.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('歌单', style: Styles.small_normal),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: Styles.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf2b5,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Styles.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('排行榜', style: Styles.small_normal),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: Styles.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf35c,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Styles.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('电台', style: Styles.small_normal),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: Styles.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf380,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Styles.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('直播', style: Styles.small_normal),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
