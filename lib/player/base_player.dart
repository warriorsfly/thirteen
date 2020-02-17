
import 'package:audioplayers/audioplayers.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/audio_player_status.dart';

abstract class BaseAudioPlayer {
  const BaseAudioPlayer();
  /// 创建音乐播放器
  AudioPlayer createPlayer();
  /// 播放器模式
  AudioPlayerMode get mode;
  /// 播放器状态
  AudioPlayerStatus get status;
  /// 播放
  void play();
  /// 暂停
  void pause();
  /// 停止
  void stop();
}