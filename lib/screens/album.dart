import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album.dart';

class AlbumScreen extends StatelessWidget {
  final Album album;

  const AlbumScreen({Key key, @required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Albums'),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid.count(crossAxisCount: 2,
            children: <Widget>[
              
            ]),
          SliverSafeArea(
            sliver: SliverList(delegate: null,

            ),
          )
        ],
      ),
    );
  }
}
