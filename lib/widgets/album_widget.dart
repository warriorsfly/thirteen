import 'package:flutter/cupertino.dart';
import 'package:thirteen/dimen.dart';
import 'package:thirteen/styles.dart';
import 'package:thirteen/widgets/cover_widget.dart';

class AlbumWidget extends StatefulWidget {
  final String url;
  final String playCount;
  final String content;
  final Object tag;
  final VoidCallback onPressed;
  const AlbumWidget({
    Key key,
    @required this.url,
    @required this.playCount,
    @required this.content,
    this.tag = '',
    this.onPressed,
  }) : super(key: key);
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
      child: Hero(
        tag: widget.tag,
        child: AnimatedContainer(
            onEnd: () {
              if (_pressed) {
                if (widget.onPressed != null) widget.onPressed();
                _updatePressedState(false);
              }
            },
            padding: EdgeInsets.all(Dimen.paddingNormal),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            width: _pressed ? Dimen.albumSizeSmall : Dimen.albumSizeNormal,
            // height: _pressed ? Dimen.albumSizeSmall: Dimen.albumSizeNormal,
            child: Column(
              children: <Widget>[
                CoverWidget(
                  playCount: widget.playCount,
                  url: widget.url,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimen.paddingNormal),
                  child: Text(
                    widget.content,
                    style: Styles.textNormal,
                    maxLines: 2,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
