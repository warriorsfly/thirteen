import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:thirteen/data/api/user_api.dart';
import 'package:thirteen/data/entity/user/account.dart';
import 'package:thirteen/data/entity/user/login_result.dart';
import 'package:thirteen/data/entity/user/profile.dart';

class ThirteenAppModel extends ChangeNotifier {
  // 账户信息
  Account account;

  Profile profile;

  // token
  String token;
  bool isLogin = false;

  void getLoginStatus() async {
    var response = await http.get(UserApi.LOGIN_STATUS_URL);
    var json = jsonDecode(response.body);
    var res = LoginResult.fromJson(json);
    switch (res.code) {
      case HttpStatus.ok:
        account = res.account;
        profile = res.profile;
        token = res.token;
        break;
      case HttpStatus.movedPermanently:
        break;
    }
  }
}
