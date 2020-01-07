import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:thirteen/data/api/discover_api.dart';
import 'package:thirteen/data/entity/netease/ad.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/data/entity/netease/personalized.dart';

class DiscoverModel extends ChangeNotifier {
  DiscoverModel() {
    loadData();
  }
  List<Ad> _ads = [];

  List<Ad> get ads => _ads;

  set ads(List<Ad> ads) {
    this._ads = ads;
    notifyListeners();
  }

  List<Album> _albums = [];
  List<Album> get albums => _albums;

  set albums(List<Album> albums) {
    this._albums = albums;
    notifyListeners();
  }

  void loadData() async {
    var response = await Future.wait([
      http.get(DiscoverApi.BANNER_LIST_URL),
      http.get(DiscoverApi.PERSONALIZED_URL),
    ]);

    var jsonAds = jsonDecode(response[0].body);
    var jsonPersonalized = jsonDecode(response[1].body);
    ads = ResponseAds.fromJson(jsonAds).ads;
    albums = Personalized.fromJson(jsonPersonalized).data;
  }

  /// 查询广告列表
  // void getAds() async {
  //   var res = await http.get(DiscoverApi.BANNER_LIST_URL);
  //   var json = jsonDecode(res.body);
  //   var resb = ResponseAds.fromJson(json);

  //   ads = resb.ads;
  // }

  // /// 查询推荐歌单列表
  // Future<Personalized> getPersonalized() async {
  //   var response = await http.get(DiscoverApi.PERSONALIZED_URL);
  //   var json = jsonDecode(response.body);
  //   var res = Personalized.fromJson(json);

  //   return res;
  // }

}
