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

  AudioPlayerMode mode = AudioPlayerMode.Cycle;

  AudioPlayerStatus status = AudioPlayerStatus.Stoped;

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
  void last() {
    if (_index > 0) index--;
  }

  void _playRemote(String url) async {
     if (_player == null) {
       AudioPlayer.logEnabled = true;
        _player = AudioPlayer();
      }
    await _player.play(currentOne.songUrl);
  }

  /// 播放
  void play() {}

  /// 暂停
  void pause() {}
  @override
  void dispose() async {
    await _player.release();
    await _player.dispose();
    super.dispose();
  }
}
