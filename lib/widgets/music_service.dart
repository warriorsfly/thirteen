import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class MusicService extends InheritedWidget {
  final AudioPlayer player;

  const MusicService({
    Key key,
    @required this.player,
    @required Widget child,
  })  : assert(player != null),
        assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
