import 'package:audioplayers/audioplayers.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class PlayListModel {
  final AudioPlayer player = AudioPlayer();

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

  List<Track> _tracks;
  List<Track> get tracks => _tracks;

  int _index = -1;

  int get index => _index;

  set index(int ind) {
    _index = ind;
    // notifyListeners();
    if (_index == -1) {
      player.stop();
    } else {
      _playRemote(_tracks[_index].songUrl);
    }
  }

  AudioPlayerMode mode = AudioPlayerMode.Cycle;

  /// 播放歌单
  void playAlbum(List<Track> tracks, int index) {
    _tracks = tracks;
    this.index = index;
  }

  /// 下一首
  void next() {
    if (_index < _tracks.length - 2) index++;
  }

  /// 上一首
  void previous() {
    if (_index > 0) index--;
  }

  void _playRemote(String url) async {
    await player.play(url);
  }

  ///重新播放
  void replay() {
    _playRemote(_tracks[_index].songUrl);
  }

  /// 播放
  void resume() async {
    await player.resume();
  }

  /// 暂停
  void pause() async {
    await player.pause();
  }

  void dispose() async {
    await player.release();
    await player.dispose();
  }
}
