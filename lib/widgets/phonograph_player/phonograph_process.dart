import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/service/music_service.dart';

class PhonographProcess extends StatefulWidget {
  @override
  _PhonographProcessState createState() => _PhonographProcessState();
}

class _PhonographProcessState extends State<PhonographProcess> {
  /// 音乐长度
  Duration duration;

  /// 音乐播放进度
  Duration position;

  final List<StreamSubscription> _subscriptions = List();

  /// 是否正在播放
  bool _playing = false;

  @override
  Widget build(BuildContext context) {
    final music = Provider.of<MusicService>(context);
    _playing = music.status == AudioPlayerState.PLAYING;

    var subscriptionPlayerState = music.onPlayerStateChanged.listen((event) {
      if (!mounted) return;
      bool playing = event == AudioPlayerState.PLAYING;
      if (_playing != playing)
        setState(() {
          _playing = playing;
        });
    });
    _subscriptions.add(subscriptionPlayerState);

    var subscriptionPlayerDuration = music.onDurationChanged.listen((event) {
      if (!mounted) return;
      setState(() {
        duration = event;
      });
    });

    _subscriptions.add(subscriptionPlayerDuration);
    var subscriptionPlayerPosition =
        music.onAudioPositionChanged.listen((event) {
      if (!mounted) return;
      setState(() {
        position = event;
      });
    });

    _subscriptions.add(subscriptionPlayerPosition);
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 40,
            child: Center(
              child: Text(
                '${position?.toString()?.substring(2, 7) ?? "00:00"}',
                style:
                    const TextStyle(fontSize: 10, color: Colors.colorPrimary),
              ),
            ),
          ),
          Expanded(
            child: CupertinoSlider(
              value: position?.inMilliseconds?.toDouble() ?? 0.0,
              max: duration?.inMilliseconds?.toDouble() ?? 100.0,
              onChanged: (double value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 40,
            child: Center(
              child: Text(
                '${duration?.toString()?.substring(2, 7) ?? "00:00"}',
                style:
                    const TextStyle(fontSize: 10, color: Colors.colorPrimary),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => music.previous(),
              child: Container(
                width: 58,
                height: 58,
                child: Icon(IconData(0xf449,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => music.previous(),
              child: Container(
                width: 58,
                height: 58,
                child: Icon(IconData(0xf4aa,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => music.status == AudioPlayerState.PLAYING
                  ? music.pause()
                  : music.resume(),
              child: Container(
                width: 58,
                height: 58,
                child: Icon(music.status == AudioPlayerState.PLAYING
                    ? CupertinoIcons.pause
                    : CupertinoIcons.play_arrow),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => music.next(),
              child: Container(
                width: 58,
                height: 58,
                child: Icon(IconData(0xf4ac,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                width: 58,
                height: 58,
                child: Icon(IconData(0xf3d7,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage)),
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  @override
  void dispose() {
    _subscriptions
      ..forEach((element) {
        element.cancel();
      })
      ..clear();
    super.dispose();
  }
}
