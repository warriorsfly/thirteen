// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:thirteen/data/api/netease_api.dart';
import 'package:thirteen/data/entity/netease/ad.dart';

void main() {
  test('Counter increments smoke test', () async {
    var res = await NeteaseApi.getBanners();
    var map = jsonDecode(res.body);
    var resb = ResponseAds.fromJson(map);

    expect(resb.ads.length > 0, true);
  });
}
