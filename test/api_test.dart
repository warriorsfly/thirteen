// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:thirteen/data/api/discover_api.dart';
import 'package:thirteen/data/entity/netease/banner.dart';

void main() {
  test('Counter increments smoke test', () async {
    var res = await http.get(DiscoverApi.BANNER_LIST_URL);
    var map = jsonDecode(res.body);
    var resb = RespBanner.fromJson(map);

    expect(resb.banners.length > 0, true);
  });
}
