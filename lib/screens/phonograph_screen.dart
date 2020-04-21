import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/service/music_service.dart';
import 'package:thirteen/widgets/imaged_background.dart';
import 'package:thirteen/widgets/phonograph_player/vinly.dart';

class PhonographScreen extends StatefulWidget {
  const PhonographScreen({Key key}) : super(key: key);
  @override
  _PhonographScreenState createState() => _PhonographScreenState();
}

class _PhonographScreenState extends State<PhonographScreen>
    with SingleTickerProviderStateMixin {
  ///状态变化中间参数
  // bool indexChanged = false;

  /// 是否正在播放
  bool _playing = false;

  /// 音乐长度
  Duration duration;

  /// 音乐播放进度
  Duration position;

  final List<StreamSubscription> _subscriptions = List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final music = Provider.of<MusicService>(context);

    //同一个歌单,同一首歌从歌单点击进来,onPlayerStateChanged不会触发,
    //读取当前播放器播放状态作为播放器初始状态
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
  }

  @override
  Widget build(BuildContext context) {
    final music = Provider.of<MusicService>(context);

    return CupertinoPageScaffold(
      backgroundColor: Colors.colorPrimaryDark,
      // navigationBar:
      //     CupertinoNavigationBar(middle: Text(tracks[currentIndex].al.name)),
      child: Stack(children: <Widget>[
        ImagedBackground(url: music.current.al.picUrl),
        Column(
          children: <Widget>[
            _buildTitle(context),
            Expanded(
              child: Vinly(),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 40,
                  child: Center(
                    child: Text(
                      '${position?.toString()?.substring(2, 7) ?? "00:00"}',
                      style: const TextStyle(
                          fontSize: 10, color: Colors.colorPrimary),
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
                      style: const TextStyle(
                          fontSize: 10, color: Colors.colorPrimary),
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
                    onTap: () => _playing ? music.pause() : music.resume(),
                    child: Container(
                      width: 58,
                      height: 58,
                      child: Icon(_playing
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
          ],
        ),
      ]),
    );
  }

  /// 标题
  Widget _buildTitle(BuildContext context) {
    final music = Provider.of<MusicService>(context);
    return SafeArea(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              CupertinoIcons.left_chevron,
              // color: Colors.colorWhite,
              size: 28,
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(music.current?.al?.name ?? "",
                      maxLines: 1,
                      style:
                          TextStyle(color: Colors.colorPrimary, fontSize: 14)),
                  Text(music.current?.ar[0]?.name ?? "",
                      style: TextStyle(
                        color: Colors.colorPrimary,
                        fontSize: 8,
                      )),
                ],
              ),
            ),
          ),
          GestureDetector(
            // onTap: () => Navigator.pop(context),
            child: Icon(
              CupertinoIcons.flag,
              // color: Colors.colorWhite,
              size: 28,
            ),
          ),
        ],
      ),
    );
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
