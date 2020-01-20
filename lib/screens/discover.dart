import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/model/discover_model.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/screens/album.dart';
import 'package:thirteen/styles.dart';
import 'package:thirteen/widgets/ad.dart';
import 'package:thirteen/widgets/album_widget.dart';

class DiscoverScreen extends StatefulWidget {
  // final PageController _controller = PageController();
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
          navigationBar: CupertinoNavigationBar(middle: Text('发现')
              // SearchBar(
              //   controller: _controller,
              //   focusNode: _focusNode,
              // ),
              ),
          child: CustomScrollView(slivers: <Widget>[
            SliverSafeArea(
              top: true,
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 5),
                child: AdWidget(
                  ad: model.ads[0],
                ),
              )
            ]))),
            // PageView.builder(
            //   controller: widget._controller,
            //   itemCount: model.ads.length,
            //   itemBuilder: (context, index) => AdWidget(
            //     ad: model.ads[index],
            //   ),
            // )

            SliverGrid.count(
              crossAxisCount: 5,
              childAspectRatio: 3/2,
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
                            const IconData(0xf2d1,
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
                            const IconData(0xf415,
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
                  height: 155,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.albums.length,
                    itemBuilder: (context, index) => AlbumWidget(
                        content: model.albums[index].name,
                        url: model.albums[index].picUrl,
                        playCount: model.albums[index].play,
                        tag: model.albums[index].id,
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).push(
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      AlbumScreen(album: model.albums[index])),
                            )),
                  )),
            ),
          ]),
        );
      }
    });
  }
}
