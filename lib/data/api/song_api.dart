import 'api.dart';

abstract class SongApi {
  /// 入口
  /// 播放地址
  /// example /song/url?id=33894312 /song/url?id=405998841,33894312
  static const SONG_URL = '${API.SONG_END_POINT}/song/url';
}
