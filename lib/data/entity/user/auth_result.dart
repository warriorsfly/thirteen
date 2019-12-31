import 'package:flutter/foundation.dart';
import 'package:thirteen/data/entity/user/account.dart';

class AuthResult {

  const AuthResult({
    @required this.loginType,
    @required this.code,
    @required this.account,
    @required this.token,
  });
  final int loginType;
  final int code;
  final Account account;
  final String token;
}