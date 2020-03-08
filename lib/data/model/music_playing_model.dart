import 'package:audioplayers/audioplayers.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class MusicPlaying {
  final AudioPlayer _player = AudioPlayer();

  /// 播放器当前播放状态
  AudioPlayerState get status => _player.state;

  /// 播放器状态
  Stream<AudioPlayerState> get onPlayerStateChanged =>
      _player.onPlayerStateChanged;

  /// 当前歌曲播放完毕事件
  Stream<void> get onPlayerCompletion => _player.onPlayerCompletion;

  /// 总时长
  Stream<Duration> get onDurationChanged => _player.onDurationChanged;

  /// 播放进度
  Stream<Duration> get onAudioPositionChanged => _player.onAudioPositionChanged;
  Track track;

  /// 总进度
  Duration duration;

  ///当前播放进度
  Duration position;
}
