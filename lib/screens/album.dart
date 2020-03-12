import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/screens/phonograph_screen.dart';
import 'package:thirteen/styles.dart';
import 'package:thirteen/widgets/cover_widget.dart';

import 'package:thirteen/data/api/netease_api.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';
import 'package:thirteen/widgets/imaged_background.dart';
import 'package:thirteen/widgets/player_service.dart';

class AlbumScreen extends StatelessWidget {
  final Album album;

  const AlbumScreen({Key key, @required this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.colorPrimaryDark,
      child: FutureBuilder(
        future: NeteaseApi.getTracks(album.id),
        builder: (_, AsyncSnapshot<AlbumDetail> snap) {
          switch (snap.connectionState) {
            case ConnectionState.done:
              if (snap.hasData) {
                return Stack(children: <Widget>[
                  ImagedBackground(url: album.picUrl),
                  _buildTrackPage(context, snap.data),
                ]);
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

  Widget _buildTrackPage(BuildContext context, AlbumDetail data) {
    return CustomScrollView(
      slivers: <Widget>[
        // CupertinoSliverNavigationBar(
        //   automaticallyImplyTitle: true,
        //   largeTitle: null,
        // ),
        _buildTrackHead(data),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(_buildTrackList(context, data)),
          itemExtent: 50,
        ),
      ],
    );
  }

  Widget _buildTrackItem(BuildContext context, List<Track> tracks, int index) {
    return GestureDetector(
      onTap: () {
        final music = PlayerService.of(context).music;
        music.playAlbum(tracks, index);
        Navigator.of(context, rootNavigator: true).push(
          CupertinoPageRoute(builder: (context) => PhonographScreen()),
        );
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.colorWhite,
        // constraints: BoxConstraints(),
        child: Row(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: Colors.colorGrayWhite, fontSize: 14),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tracks[index].al.name,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      tracks[index]
                          .ar
                          .map((Artist artist) => artist.name)
                          .join(),
                      style:
                          TextStyle(color: Colors.colorGrayWhite, fontSize: 9),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTrackList(BuildContext context, AlbumDetail data) {
    var widgets = new List<Widget>();
    return widgets
      ..add(CupertinoScrollbar(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          child: Container(
            color: Colors.colorWhite,
            child: Center(
              child: Text('离群索居者，不是野兽便是神灵'),
            ),
          ),
        ),
      ))
      ..addAll(data.playlist.tracks.map((Track track) => _buildTrackItem(
          context, data.playlist.tracks, data.playlist.tracks.indexOf(track))));
  }

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
                  playCount: album.play,
                  url: album.picUrl,
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
                          album.name,
                          style: Styles.textStyleAlbumTitleDark,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: data.playlist.creator.avatarUrl,
                                placeholder: (context, url) =>
                                    CupertinoActivityIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(CupertinoIcons.clear),
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
                            color: Colors.colorGrayWhite,
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
                                    color: Colors.color90White),
                                maxLines: 2,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: Colors.colorGrayWhite,
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
