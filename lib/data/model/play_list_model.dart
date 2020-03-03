import 'package:thirteen/data/entity/netease/album_detail.dart';

class PlayListModel {
  List<Track> tracks = [];

  int index = -1;

  Track get current {
    if (tracks.length == 0 || index == -1) return null;
    return tracks[index];
  }

  /// 下一首
  void next() {
    if (index < tracks.length - 2) index++;
  }

  /// 上一首
  void previous() {
    if (index > 0) index--;
  }
}
