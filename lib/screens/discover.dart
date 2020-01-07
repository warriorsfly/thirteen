import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/model/discover_model.dart';
import 'package:thirteen/styles.dart';
import 'package:thirteen/widgets/ad.dart';
import 'package:thirteen/widgets/album.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverModel>(builder: (context, value, child) {
      if (value.ads.length == 0 || value.albums.length == 0) {
        return Container(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      } else {
        return CustomScrollView(slivers: <Widget>[
 
          SliverList(
              delegate: SliverChildListDelegate([
            AdWidget(
              ad: value.ads[0],
            ),
          ])),
          SliverGrid.count(
            crossAxisCount: 5,
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: Colors.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf35c,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('每日推荐', style: Styles.text_normal),
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
                        color: Colors.colorPrimaryDark,
                        child: Icon(
                          CupertinoIcons.music_note,
                          color: Colors.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('歌单', style: Styles.text_normal),
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
                        color: Colors.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf2b5,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('排行榜', style: Styles.text_normal),
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
                        color: Colors.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf35c,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('电台', style: Styles.text_normal),
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
                        color: Colors.colorPrimaryDark,
                        child: Icon(
                          const IconData(0xf380,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                          color: Colors.colorWhite,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    child: Text('直播', style: Styles.text_normal),
                  )
                ],
              ),
            ],
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) => Container(
                child: AlbumWidget(
                  alblum: value.albums[index],
                ),
              ),
              childCount: value.albums.length,
            ),
          )
        ]);
      }
    });
  }
}
