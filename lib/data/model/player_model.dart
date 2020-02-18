import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/audio_player_status.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class PlayerModel extends ChangeNotifier {
  AudioPlayer _player;

  List<Track> _tracks;

  int _index = -1;

  int get index => _index;

  set index(int ind) {
    _index = ind;
    if (_index == -1) {
      if (_player != null) _player.stop();
    } else {
      _playRemote(currentOne.songUrl);
    }
    // notifyListeners();
  }

  Track get currentOne {
    if (_index == -1 || _tracks == null || _index >= _tracks.length)
      return null;
    return _tracks[_index];
  }

  AudioPlayerMode _mode = AudioPlayerMode.Cycle;
  AudioPlayerMode get mode => _mode;
  set mode(AudioPlayerMode value) {
    _mode = value;
    notifyListeners();
  }

  AudioPlayerStatus _status = AudioPlayerStatus.Stoped;
  AudioPlayerStatus get status => _status;
  set status(AudioPlayerStatus value) {
    _status = value;
    notifyListeners();
  }

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
    if (_player == null) {
      AudioPlayer.logEnabled = true;
      _player = AudioPlayer();
    }
    var result = await _player.play(currentOne.songUrl);
    zsstatus =
        result == 1 ? AudioPlayerStatus.Playing : AudioPlayerStatus.Stoped;
    // notifyListeners();
  }

  /// 播放
  void resume() async {
    var result = await _player.resume();
    status = result == 1 ? AudioPlayerStatus.Playing : AudioPlayerStatus.Stoped;
  }

  /// 暂停
  void pause() async {
    var result = await _player.pause();
    status = result == 1 ? AudioPlayerStatus.Paused : AudioPlayerStatus.Stoped;
  }

  @override
  void dispose() async {
    await _player.release();
    await _player.dispose();
    super.dispose();
  }
}
