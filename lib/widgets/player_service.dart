import 'package:flutter/cupertino.dart';
import 'package:thirteen/service/music_service.dart';

class PlayerService extends InheritedWidget {
  final MusicService music;

  const PlayerService({
    Key key,
    @required this.music,
    @required Widget child,
  })  : assert(music != null),
        assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(PlayerService oldWidget) => music != oldWidget.music;

  static PlayerService of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PlayerService>();
}
