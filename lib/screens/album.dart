import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/styles.dart';
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
      backgroundColor: Colors.colorPrimaryDark,
      navigationBar: CupertinoNavigationBar(
        middle: Text('歌单'),
        backgroundColor: Colors.colorWhite.withOpacity(0),
      ),
      child: FutureBuilder(
        future: NeteaseApi.getTracks(widget.album.id),
        builder: (_, AsyncSnapshot<AlbumDetail> snap) {
          switch (snap.connectionState) {
            case ConnectionState.done:
              if (snap.hasData) {
                return _buildTrackPage(snap.data);
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

  Widget _buildTrackPage(AlbumDetail data) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildTrackHead(data),
      ],
    );
  }

  // SliverList _buildTrackList(AlbumDetail data){

  // }

  SliverSafeArea _buildTrackHead(AlbumDetail data) {
    return SliverSafeArea(
      top: true,
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: <Widget>[
              Container(
                width: 140,
                child: CoverWidget(
                  playCount: widget.album.play,
                  url: widget.album.picUrl,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: Dimen.marginSmall),
                        child: Text(
                          widget.album.name,
                          style: Styles.textStyleAlbumTitleDark,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: ClipOval(
                              child: Image.network(
                                data.playlist.creator.avatarUrl,
                                width: Dimen.avatarSizeNormal,
                              ),
                            ),
                          ),
                          Text(
                            data.playlist.creator.nickname,
                            style: Styles.textStyleCreator,
                          ),
                          Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.color90White,
                            size: 2 * Dimen.textSizeNormal,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimen.marginMiddle),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                data.playlist.description,
                                style: TextStyle(
                                    fontSize: Dimen.textSizeSmall,
                                    color: Colors.color80White),
                                maxLines: 2,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: Colors.color90White,
                              size: 2 * Dimen.textSizeNormal,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ])),
    );
  }
}
