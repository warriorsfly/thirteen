import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/widgets/cover_widget.dart';

import 'package:thirteen/data/api/netease_api.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';


class AlbumScreen extends StatefulWidget {
  final Album album;

  const AlbumScreen({Key key, @required this.album}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('歌单'),
      ),
      child: FutureBuilder(
        future: NeteaseApi.getTracks(widget.album.id),
        builder: (_, AsyncSnapshot<AlbumDetail> snap) {
          switch (snap.connectionState) {
            case ConnectionState.done:
              if (snap.hasData) {
                return _loadedSuccess(snap.data);
              } else if (snap.hasError) {
                return Container(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
              }

              return Container(
                child: Center(
                  child: Text('Unkown error'),
                ),
              );

            default:
              return Container(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
          }
        },
      ),
    );
  }

  Widget _loadedSuccess(AlbumDetail data) {
    return CustomScrollView(
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
                      playCount: widget.album.play,
                      url: widget.album.picUrl,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      children: <Widget>[
                        // Text(data.)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ])),
        )
      ],
    );
  }
}
