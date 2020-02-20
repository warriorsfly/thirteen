import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';
import 'package:thirteen/data/model/play_list_model.dart';

class PhonographScreen extends StatefulWidget {
  final List<Track> tracks;
  final int initalIndex;

  const PhonographScreen({Key key, this.tracks, this.initalIndex})
      : super(key: key);
  @override
  _PhonographScreenState createState() => _PhonographScreenState();
}

class _PhonographScreenState extends State<PhonographScreen>
    with SingleTickerProviderStateMixin {
  /// 当前index
  int currentIndex = -1;

  /// 音乐列表
  List<Track> tracks;

  ///状态变化中间参数
  bool indexChanged = false;

  /// 是否正在播放
  bool _playing = false;

  /// 音乐长度
  double duration = 0;

  /// 音乐播放进度
  double position = 0;

  AnimationController _animationController;
  PageController _pageController;
  StreamSubscription<AudioPlayerState> _subscriptionPlayerState;
  StreamSubscription<void> _subscriptionPlayerCompletion;
  StreamSubscription<Duration> _subscriptionPlayerDuration;
  StreamSubscription<Duration> _subscriptionPlayerPosition;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initalIndex;
    tracks = widget.tracks;

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 24))
          ..repeat();

    _pageController = PageController(
      initialPage: currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: 0,
      end: 2 * pi,
    ).animate(_animationController);

    final model = Provider.of<PlayListModel>(context);
    if (model.index != currentIndex || model.tracks != tracks) {
      model.playAlbum(tracks, currentIndex);
      _subscriptionPlayerState = model.onPlayerStateChanged.listen((event) {
        if (mounted) return;
        bool playing = event == AudioPlayerState.PLAYING;
        if (_playing != playing)
          setState(() {
            _playing = playing;
          });
      });
      _subscriptionPlayerCompletion = model.onPlayerCompletion.listen((event) {
        if (mounted) return;
        switch (model.mode) {
          case AudioPlayerMode.Cycle:
            _pageController.nextPage(
                duration: Duration(milliseconds: 800),
                curve: Curves.linearToEaseOut);
            break;
          case AudioPlayerMode.Single:
            model.replay();
            break;
          case AudioPlayerMode.Random:
            break;
        }
      });
    }

    _subscriptionPlayerDuration = model.onDurationChanged.listen((event) {
      if (mounted) return;
      double dur = event.inMilliseconds.toDouble();
      setState(() {
        duration = dur;
      });
    });
    _subscriptionPlayerPosition = model.onAudioPositionChanged.listen((event) {
      if (mounted) return;
      double pos = event.inMilliseconds.toDouble();
      setState(() {
        position = pos;
      });
    });

    return CupertinoPageScaffold(
      backgroundColor: Colors.colorPrimaryDark,
      navigationBar:
          CupertinoNavigationBar(middle: Text(tracks[currentIndex].al.name)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.only(top: 110),
                  child: PageView.builder(
                    itemCount: tracks.length,
                    onPageChanged: (ind) {
                      if (mounted) return;
                      setState(() {
                        currentIndex = ind;
                        model.index = ind;
                        indexChanged = true;
                      });
                    },
                    controller: _pageController,
                    itemBuilder: (context, index) => Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: index == model.index && _playing
                                ? AnimatedBuilder(
                                    animation: animation,
                                    builder: (context, child) =>
                                        Transform.rotate(
                                          angle: animation.value,
                                          child: _buildVinylItem(
                                              tracks[index].al.picUrl),
                                        ))
                                : _buildVinylItem(tracks[index].al.picUrl),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -103,
                  child: Container(
                    width: 321,
                    height: 321,
                    child: AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) => Transform.rotate(
                        angle: (indexChanged
                                    ? _pageController.page
                                    : _pageController.initialPage) ==
                                currentIndex
                            ? 0
                            : -0.3,
                        child: Image.asset('assets/images/styli.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () => model.previous(),
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(CupertinoIcons.heart),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () => _pageController.previousPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.linearToEaseOut),
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(CupertinoIcons.left_chevron),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () => _playing ? model.pause() : model.resume(),
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(_playing
                            ? CupertinoIcons.pause
                            : CupertinoIcons.play_arrow),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () => _pageController.nextPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.linearToEaseOut),
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(CupertinoIcons.right_chevron),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () => model.previous(),
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(CupertinoIcons.music_note),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///旋转封面
  Widget _buildVinylItem(String url) {
    return Container(
      width: 304,
      height: 304,
      // padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/disk.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 202,
          height: 202,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/vinyl.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(101)),
            child: Image.network(
              url,
              fit: BoxFit.fill,
              // loadingBuilder: (context,widget,),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subscriptionPlayerState.cancel();
    _subscriptionPlayerCompletion.cancel();
    _subscriptionPlayerDuration.cancel();
    _subscriptionPlayerPosition.cancel();
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
