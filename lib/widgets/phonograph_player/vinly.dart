import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';
import 'package:thirteen/screens/large_image.dart';
import 'package:thirteen/widgets/player_service.dart';

class Vinly extends StatefulWidget {
  @override
  _VinlyPlayerState createState() => _VinlyPlayerState();
}

class _VinlyPlayerState extends State<Vinly>
    with SingleTickerProviderStateMixin {
  /// 显示歌词
  bool _showLyrics = false;

  /// 当前index
  int _currentIndex = 0;

  /// 音乐列表
  List<Track> _tracks = [];

  /// 动画
  var _animation;

  /// 正在播放
  bool _playing = false;

  /// 唱针动画控制器
  AnimationController _animationController;

  /// 翻页控制器
  PageController _pageController;

  /// 订阅
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 24))
          ..repeat();

    _animation = Tween(
      begin: 0,
      end: 2 * pi,
    ).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final music = PlayerService.of(context).music;
    _tracks = music.tracks;
    _currentIndex = music.index;
    //同一个歌单,同一首歌从歌单点击进来,onPlayerStateChanged不会触发,
    //读取当前播放器播放状态作为播放器初始状态
    _playing = music.status == AudioPlayerState.PLAYING;
    _pageController = PageController(
      initialPage: _currentIndex,
    );

    var subscriptionPlayerState = music.onPlayerStateChanged.listen((event) {
      if (!mounted) return;
      bool playing = event == AudioPlayerState.PLAYING;
      if (_playing != playing)
        setState(() {
          _playing = playing;
        });
    });
    _subscriptions.add(subscriptionPlayerState);

    var subscriptionPlayerCompletion = music.onPlayerCompletion.listen((event) {
      if (!mounted) return;
      switch (music.mode) {
        case AudioPlayerMode.Cycle:
          _pageController.nextPage(
              duration: Duration(milliseconds: 800),
              curve: Curves.linearToEaseOut);
          break;
        case AudioPlayerMode.Single:
          music.replay();
          break;
        case AudioPlayerMode.Random:
          break;
      }
    });

    _subscriptions.add(subscriptionPlayerCompletion);
  }

  @override
  Widget build(BuildContext context) {
    final music = PlayerService.of(context).music;
    return IntrinsicHeight(
      child: AnimatedCrossFade(
        crossFadeState:
            _showLyrics ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 400),
        firstChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    width: double.infinity,
                    height: 297,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/placing.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: PageView.builder(
                      itemCount: _tracks.length,
                      onPageChanged: (ind) {
                        if (!mounted) return;
                        setState(() {
                          _currentIndex = ind;
                          music.index = ind;
                          // indexChanged = true;
                        });
                      },
                      controller: _pageController,
                      itemBuilder: (context, index) => Row(
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: index == music.index && _playing
                                  ? AnimatedBuilder(
                                      animation: _animation,
                                      builder: (context, child) =>
                                          Transform.rotate(
                                            angle: _animation.value,
                                            child: _buildVinylItem(context,
                                                _tracks[index].al.picUrl),
                                          ))
                                  : _buildVinylItem(
                                      context, _tracks[index].al.picUrl),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -144,
                    child: Container(
                      width: 321,
                      height: 321,
                      child: AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) => Transform.rotate(
                          angle:
                              _pageController.page == _currentIndex && _playing
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
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(CupertinoIcons.heart),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        child: Container(
                      width: 58,
                      height: 58,
                      child: Icon(IconData(0xf3d4,
                          fontFamily: CupertinoIcons.iconFont,
                          fontPackage: CupertinoIcons.iconFontPackage)),
                    )),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(IconData(0xf3e1,
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
                        child: Icon(CupertinoIcons.conversation_bubble),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => music.previous(),
                      child: Container(
                        width: 58,
                        height: 58,
                        child: Icon(IconData(0xf397,
                            fontFamily: CupertinoIcons.iconFont,
                            fontPackage: CupertinoIcons.iconFontPackage)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        secondChild: GestureDetector(
          onTap: () => setState(() {
            _showLyrics = !_showLyrics;
          }),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      "歌词",
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  ///旋转封面
  Widget _buildVinylItem(BuildContext context, String url) {
    return Container(
      width: 297,
      height: 297,
      // padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/disk.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => setState(() {
          _showLyrics = !_showLyrics;
        }),
        onLongPress: () =>
            Navigator.push<void>(context, toLargeImageRoute(context, url)),
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
                fit: BoxFit.cover,
                // loadingBuilder: (context,widget,),
              ),
            ),
          ),
        ),
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
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
