import 'package:flutter/cupertino.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/styles.dart';

class AlbumWidget extends StatefulWidget {
  final String imageUrl;
  final String content;
  final Object tag;

  const AlbumWidget(
      {Key key,
      @required this.imageUrl,
      @required this.content,
      @required this.tag})
      : super(key: key);
  @override
  _AlbumWidgetState createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  final Duration _duration = Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: AnimatedContainer(
        height: 200,
        padding: EdgeInsets.all(Dimen.paddingNormal),
        child: Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Hero(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimen.radiusNormal),
                    child: Container(
                      width: Dimen.albumSize,
                      height: Dimen.albumSize,
                      child: Image.network(widget.imageUrl),
                    ),
                  ),
                  tag: widget.tag,
                ),
                Container(
                  width: Dimen.albumSize,
                  padding: EdgeInsets.only(
                      top: Dimen.paddingNormal, bottom: Dimen.paddingNormal),
                  child: Text(
                    widget.content,
                    style: Styles.textNormal,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
        duration: _duration,
      ),
    );
  }
}
