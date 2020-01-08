import 'package:flutter/cupertino.dart';
import 'package:thirteen/styles.dart';

class AlbumWidget extends StatefulWidget {
  final String imageUrl;
  final String content;
  final Object tag;

  const AlbumWidget({Key key, this.imageUrl, this.content, this.tag})
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(widget.imageUrl),
                ),
              ),
              tag: widget.tag,
            ),
            Container(
              width: 100,
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                widget.content,
                style: Styles.textNormal,
                maxLines: 2,
              ),
            ),
          ],
        ),
        duration: _duration,
      ),
    );
  }
}
