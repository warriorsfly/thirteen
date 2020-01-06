import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:thirteen/data/api/discover_api.dart';
import 'package:thirteen/data/entity/netease/banner.dart';
import 'package:thirteen/data/entity/netease/personalized.dart';

class DiscoverModel extends ChangeNotifier {
  /// 查询广告列表
  Future<List<BannerEntity>> findBanners() async {
    var res = await http.get(DiscoverApi.BANNER_LIST_URL);
    var json = jsonDecode(res.body);
    var resb = RespBanner.fromJson(json);

    return resb.banners;
  }

  /// 查询推荐歌单列表
  Future<Personalized> findAl() async {
    var response = await http.get(DiscoverApi.PERSONALIZED_URL);
    var json = jsonDecode(response.body);
    var res = Personalized.fromJson(json);

    return res;
  }

  
}
