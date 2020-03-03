import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class PlayerModel extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();

  /// 当前播放的歌曲
  Track _track;

  /// 当前播放的歌曲
  Track get track => _track;
  set track(Track value) {
    if (value == _track) return;
    _track = value;
    _play(_track.songUrl);
    notifyListeners();
  }

  /// 播放器当前播放状态
  AudioPlayerState get status => player.state;

  /// 播放器状态
  Stream<AudioPlayerState> get onPlayerStateChanged =>
      player.onPlayerStateChanged;

  /// 当前歌曲播放完毕事件
  Stream<void> get onPlayerCompletion => player.onPlayerCompletion;

  /// 总时长
  Stream<Duration> get onDurationChanged => player.onDurationChanged;

  /// 播放进度
  Stream<Duration> get onAudioPositionChanged => player.onAudioPositionChanged;

  void _play(String url) async {
    await player.play(url);
  }

  ///重新播放
  void replay() {
    _play(_track.songUrl);
  }

  /// 播放
  void resume() async {
    await player.resume();
  }

  /// 暂停
  void pause() async {
    await player.pause();
  }

  /// release 播放器
  @override
  void dispose() async {
    await player.release();
    await player.dispose();
    super.dispose();
  }
}
