import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/data/model/player_model.dart';

class MusicPlayerControl extends StatefulWidget {
  @override
  _MusicPlayerControlState createState() => _MusicPlayerControlState();
}

class _MusicPlayerControlState extends State<MusicPlayerControl> {
  @override
  Widget build(BuildContext context) {
    final PlayerModel model = Provider.of<PlayerModel>(context);
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
              onTap: () => model.previous(),
              child: Container(
                child: Icon(CupertinoIcons.heart),
              )),
        ),
        Expanded(
          child: GestureDetector(
              onTap: () => model.previous(),
              child: Container(
                child: Icon(CupertinoIcons.left_chevron),
              )),
        ),
        Expanded(
          child: GestureDetector(
              onTap: () => model.previous(),
              child: Container(
                child: Icon(CupertinoIcons.play_arrow),
              )),
        ),
        Expanded(
          child: GestureDetector(
              onTap: () => model.next(),
              child: Container(
                child: Icon(CupertinoIcons.right_chevron),
              )),
        ),
        Expanded(
          child: GestureDetector(
              onTap: () => model.previous(),
              child: Container(
                child: Icon(CupertinoIcons.music_note),
              )),
        ),
      ],
    ));
  }
}
