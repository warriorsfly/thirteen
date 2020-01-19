import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:thirteen/data/api/user_api.dart';
import 'package:thirteen/data/entity/user/account.dart';
import 'package:thirteen/data/entity/user/login_result.dart';
import 'package:thirteen/data/entity/user/profile.dart';

class ThirteenAppModel extends ChangeNotifier {
  // 账户信息
  Account account;

  Profile profile;

  // AudioPlayer player;


  // token
  String token;
  bool isLogin = false;

  void getLoginStatus() async {
    var response = await UserApi.getLoginStatus();
    var json = jsonDecode(response.body);
    var res = LoginResult.fromJson(json);
    switch (res.code) {
      case HttpStatus.ok:
        account = res.account;
        profile = res.profile;
        token = res.token;
        isLogin = true;
        break;
      case HttpStatus.movedPermanently:
        break;
    }
  }
}
