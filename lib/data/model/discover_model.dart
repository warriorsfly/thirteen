import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:thirteen/data/api/discover_api.dart';
import 'package:thirteen/data/entity/banner.dart';

class DiscoverModel extends ChangeNotifier {
  Future<List<BannerEntity>> findBanners() async {
    var res = await http.get(DiscoverApi.BANNER_LIST_URL);
    var json = jsonDecode(res.body);
    var resb = RespBanner.fromJson(json);

    return resb.banners;
  }
}
