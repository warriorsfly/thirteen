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
  bool _pressed = false;

  _updatePressedState(bool value) => setState(() => _pressed = value);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _updatePressedState(true),
      // onTap: Navigator.of(context).,
      onTapCancel: () => _updatePressedState(false),
      child: Container(
        padding: EdgeInsets.all(Dimen.paddingNormal),
        child: Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Hero(
                  child: AnimatedContainer(
                    onEnd: (){
                      if(_pressed) {
                        _updatePressedState(false);
                      }
                    },
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    width: _pressed? Dimen.albumSizeSmall:Dimen.albumSizeNormal,
                    height: _pressed? Dimen.albumSizeSmall:Dimen.albumSizeNormal,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimen.radiusNormal),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(widget.imageUrl),
                      ),
                    ),
                  ),
                  tag: widget.tag,
                ),
                Container(
                  width: Dimen.albumSizeNormal,
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
      ),
    );
  }
}
