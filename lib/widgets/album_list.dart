import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/styles.dart';
import 'package:thirteen/widgets/album_widget.dart';

class AlbumListWidget extends StatelessWidget {
  final String titleText;
  final String contentText;
  final String buttonText;
  final List<Album> albums;

  const AlbumListWidget(
      {Key key,
      @required this.titleText,
      @required this.contentText,
      @required this.buttonText,
      @required this.albums})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  titleText,
                  style: Styles.textNormal,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(contentText),
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Text(buttonText, style: Styles.textNormal),
                )
              ],
            ),
            ListView.builder(
              itemCount: albums.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AlbumWidget(
                content: albums[index].name,
                url: albums[index].picUrl,
                playCount: albums[index].play,
                tag: albums[index].id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
