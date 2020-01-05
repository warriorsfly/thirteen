// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return LoginResult(
    loginType: json['loginType'] as int,
    code: json['code'] as int,
    account: json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>),
    token: json['token'] as String,
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'loginType': instance.loginType,
      'code': instance.code,
      'account': instance.account,
      'token': instance.token,
      'profile': instance.profile,
    };
