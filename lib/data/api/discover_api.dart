import 'package:thirteen/data/api/api.dart';

abstract class DiscoverApi {
  /// 广告
  static const String BANNER_LIST_URL = '${API.END_POINT}/banner';

  /// 推荐歌单列表
  static const String RECOMMENT_LIST_URL =
      '${API.END_POINT}/recommend/resource';

  /// 歌单(网友精选碟)
  static const String TOP_NEW_LIST_URL =
      '${API.END_POINT}/top/playlist?limit=10&order=new';

  /// 获取精品歌单
  static const String TOP_LIST_URL = '${API.END_POINT}/top/playlist';

  /// 获取推荐歌单，默认只要6个
  static const String PERSONALIZED_URL = '${API.END_POINT}/personalized?limit=6';
}
