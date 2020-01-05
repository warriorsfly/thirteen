import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:thirteen/data/entity/user/account.dart';
import 'package:thirteen/data/entity/user/profile.dart';
part 'login_result.g.dart';

@JsonSerializable()
class LoginResult {
  const LoginResult({
    @required this.loginType,
    @required this.code,
    @required this.account,
    @required this.token,
    @required this.profile,
  });
  final int loginType;
  final int code;
  final Account account;
  final String token;
  final Profile profile;

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
