// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    avatarImgIdStr: json['avatarImgIdStr'] as String,
    backgroundImgIdStr: json['backgroundImgIdStr'] as String,
    description: json['description'] as String,
    userId: json['userId'] as String,
    vipType: json['vipType'] as int,
    gender: json['gender'] as int,
    defaultAvatar: json['defaultAvatar'] as bool,
    avatarUrl: json['avatarUrl'] as String,
    city: json['city'] as String,
    userType: json['userType'] as int,
    backgroundImgId: json['backgroundImgId'] as String,
    province: json['province'] as int,
    djStatus: json['djStatus'] as int,
    experts: json['experts'],
    mutual: json['mutual'] as bool,
    remarkName: json['remarkName'] as String,
    expertTags: json['expertTags'] as String,
    authStatus: json['authStatus'] as int,
    accountStatus: json['accountStatus'] as int,
    nickname: json['nickname'] as String,
    birthday: json['birthday'] as String,
    avatarImgId: json['avatarImgId'] as String,
    detailDescription: json['detailDescription'] as String,
    followed: json['followed'] as bool,
    backgroundUrl: json['backgroundUrl'] as String,
    signature: json['signature'] as String,
    authority: json['authority'] as int,
    followeds: json['followeds'] as int,
    follows: json['follows'] as int,
    eventCount: json['eventCount'] as int,
    playlistCount: json['playlistCount'] as int,
    playlistBeSubscribedCount: json['playlistBeSubscribedCount'] as int,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'description': instance.description,
      'userId': instance.userId,
      'vipType': instance.vipType,
      'gender': instance.gender,
      'defaultAvatar': instance.defaultAvatar,
      'avatarUrl': instance.avatarUrl,
      'city': instance.city,
      'userType': instance.userType,
      'backgroundImgId': instance.backgroundImgId,
      'province': instance.province,
      'djStatus': instance.djStatus,
      'experts': instance.experts,
      'mutual': instance.mutual,
      'remarkName': instance.remarkName,
      'expertTags': instance.expertTags,
      'authStatus': instance.authStatus,
      'accountStatus': instance.accountStatus,
      'nickname': instance.nickname,
      'birthday': instance.birthday,
      'avatarImgId': instance.avatarImgId,
      'detailDescription': instance.detailDescription,
      'followed': instance.followed,
      'backgroundUrl': instance.backgroundUrl,
      'signature': instance.signature,
      'authority': instance.authority,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'eventCount': instance.eventCount,
      'playlistCount': instance.playlistCount,
      'playlistBeSubscribedCount': instance.playlistBeSubscribedCount,
    };
