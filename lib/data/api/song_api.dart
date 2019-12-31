abstract class SongApi {

  /// 入口
  static const _END_POINT = 'https://music.163.com';

  /// 播放地址
  /// example /song/url?id=33894312 /song/url?id=405998841,33894312
  static const SONG_URL = _END_POINT + '/song/url';
}
