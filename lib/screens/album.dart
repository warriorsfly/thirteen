import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/widgets/cover_widget.dart';

class AlbumScreen extends StatelessWidget {
  final Album album;

  const AlbumScreen({Key key, @required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('歌单'),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            top: true,
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 160,
                      child: CoverWidget(
                        playCount: album.play,
                        url: album.picUrl,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        children: <Widget>[
                          // Text()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])),
          )
        ],
      ),
    );
  }
}
