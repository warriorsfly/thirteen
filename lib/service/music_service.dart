import 'package:audioplayers/audioplayers.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class MusicService {
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

  List<Track> _tracks;
  List<Track> get tracks => _tracks;

  int _index = -1;

  int get index => _index;

  set index(int ind) {
    if (_index != ind) _index = ind;
    play();
  }

  /// 播放器模式
  AudioPlayerMode mode = AudioPlayerMode.Cycle;

  /// 播放歌单
  void playAlbum(List<Track> tracks, int index) async {
    if (_tracks != tracks || _index != index) {
      _tracks = tracks;
      _index = index;
      await _player.release();
      play();
    }
  }

  /// 下一首
  void next() async {
    if (_index < _tracks.length - 2) {
      _index++;
      await _player.release();
      play();
    }
  }

  /// 上一首
  void previous() async {
    if (_index > 0) {
      _index--;
      await _player.release();
      play();
    }
  }

  void play() async {
    await _player.play(_tracks[_index].songUrl);
  }

  ///重新播放
  void replay() {
    play();
  }

  /// 播放
  void resume() async {
    await _player.resume();
  }

  /// 暂停
  void pause() async {
    await _player.pause();
  }

  void dispose() async {
    await _player.release();
    await _player.dispose();
  }
}
