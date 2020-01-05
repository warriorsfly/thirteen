// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as int,
    type: json['type'] as int,
    status: json['status'] as int,
    whitelistAuthority: json['whitelistAuthority'] as int,
    userName: json['userName'] as String,
    salt: json['salt'] as String,
    tokenVersion: json['tokenVersion'] as String,
    ban: json['ban'] as int,
    baoyueVersion: json['baoyueVersion'] as int,
    donateVersion: json['donateVersion'] as int,
    vipType: json['vipType'] as int,
    viptypeVersion: json['viptypeVersion'] as int,
    anonimousUser: json['anonimousUser'] as bool,
    createTime: json['createTime'] as int,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'whitelistAuthority': instance.whitelistAuthority,
      'userName': instance.userName,
      'salt': instance.salt,
      'tokenVersion': instance.tokenVersion,
      'ban': instance.ban,
      'baoyueVersion': instance.baoyueVersion,
      'donateVersion': instance.donateVersion,
      'vipType': instance.vipType,
      'viptypeVersion': instance.viptypeVersion,
      'anonimousUser': instance.anonimousUser,
      'createTime': instance.createTime,
    };
