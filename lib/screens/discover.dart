import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/model/discover_model.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/screens/album.dart';
import 'package:thirteen/styles.dart';
import 'package:thirteen/widgets/ad.dart';
import 'package:thirteen/widgets/album.dart';
import 'package:thirteen/widgets/search_bar.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiscoverModel>(builder: (context, model, child) {
      if (model.ads.length == 0 || model.albums.length == 0) {
        return Container(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      } else {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: SearchBar(
              controller: _controller,
              focusNode: _focusNode,
            ),
          ),
          child: CustomScrollView(
            
            slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              AdWidget(
                ad: model.ads[0],
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
                      child: Text('每日推荐', style: Styles.textNormal),
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
                      child: Text('歌单', style: Styles.textNormal),
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
                      margin: EdgeInsets.only(top: Dimen.marginNormal),
                      child: Text('排行榜', style: Styles.textNormal),
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
                      child: Text('电台', style: Styles.textNormal),
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
                      child: Text('直播', style: Styles.textNormal),
                    )
                  ],
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                  // color: Colors.colorPrimaryDark,
                  height: 155,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.albums.length,
                      itemBuilder: (context, index) => AlbumWidget(
                            content: model.albums[index].name,
                            imageUrl: model.albums[index].picUrl,
                            tag: model.albums[index].id,
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .push(CupertinoPageRoute(
                              builder: (context) => AlbumScreen(),
                              settings:
                                  RouteSettings(arguments: model.albums[index]),
                            )),
                          ))),
            ),
          ]),
        );
      }
    });
  }
}
