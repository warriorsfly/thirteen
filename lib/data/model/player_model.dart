import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/audio_player_mode.dart';
import 'package:thirteen/data/entity/audio_player_status.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class PlayerModel extends ChangeNotifier {
  AudioPlayer player;

  List<Track> _tracks;

  int _index = -1;

  int get index => _index;

  set index(int ind) {
    _index = ind;
    if (_index == -1) {
      if (player != null) player.stop();
    } else {
      _playRemote(_tracks[_index].songUrl);
    }
    // notifyListeners();
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
    if (player == null) {
      AudioPlayer.logEnabled = true;
      player = AudioPlayer();
    }
    int result = await player.play(url);
    status = result == 1 ? AudioPlayerStatus.Playing : AudioPlayerStatus.Stoped;
  }

  /// 播放
  void resume() async {
    int result = await player.resume();
    status = result == 1 ? AudioPlayerStatus.Playing : AudioPlayerStatus.Stoped;
  }

  /// 暂停
  void pause() async {
    int result = await player.pause();
    status = result == 1 ? AudioPlayerStatus.Paused : AudioPlayerStatus.Stoped;
  }

  @override
  void dispose() async {
    await player.release();
    await player.dispose();
    super.dispose();
  }
}
