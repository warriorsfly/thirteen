import 'dart:convert';

import 'package:thirteen/data/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:thirteen/data/entity/netease/album_detail.dart';

abstract class NeteaseApi {
  static const String _BANNER_LIST_URL = '${API.END_POINT}/banner';

  /// 广告
  static Future<http.Response> getBanners() async {
    return await http.get('$_BANNER_LIST_URL');
  }

  static const String RECOMMENT_LIST_URL =
      '${API.END_POINT}/recommend/resource';

  /// 推荐歌单列表
  static Future<http.Response> getRecomments() async {
    return await http.get('$RECOMMENT_LIST_URL');
  }

  static const String _TOP_NEW_LIST_URL =
      '${API.END_POINT}/top/playlist?limit=10&order=new';

  /// 歌单(网友精选碟)
  static Future<http.Response> getTopPlaylist() async {
    return await  http.get('$_TOP_NEW_LIST_URL');
  }

  static const String _TOP_LIST_URL = '${API.END_POINT}/top/playlist';

  /// 获取精品歌单
  static Future<http.Response> getTopNewPlayList() async {
    return await http.get('$_TOP_LIST_URL');
  }

  static const String _PERSONALIZE_URL =
      '${API.END_POINT}/personalized?limit=6';

  /// 获取推荐歌单，默认只要6个
  static Future<http.Response> getPersionalized() async {
    return await http.get('$_PERSONALIZE_URL');
  }

  static const String _TRACK_LIST_URL = '${API.END_POINT}/playlist/detail?id=';

  /// 获取歌单详情，包括歌单内歌曲列表
  static Future<AlbumDetail> getTracks(int id) async {
    var response = await http.get('$_TRACK_LIST_URL$id');
    var json = jsonDecode(response.body);
    return AlbumDetail.fromJson(json);
  }
}
