// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDetail _$AlbumDetailFromJson(Map<String, dynamic> json) {
  return AlbumDetail(
    json['code'] as int,
    (json['relatedVideos'] as List)?.map((e) => e as String)?.toList(),
    json['playlist'] == null
        ? null
        : PlayList.fromJson(json['playlist'] as Map<String, dynamic>),
    (json['urls'] as List)?.map((e) => e as String)?.toList(),
    (json['privileges'] as List)
        ?.map((e) =>
            e == null ? null : Privilege.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AlbumDetailToJson(AlbumDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'relatedVideos': instance.relatedVideos,
      'playlist': instance.playlist,
      'urls': instance.urls,
      'privileges': instance.privileges,
    };

PlayList _$PlayListFromJson(Map<String, dynamic> json) {
  return PlayList(
    json['id'] as int,
    (json['subscribers'] as List)
        ?.map((e) =>
            e == null ? null : NeaseUser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['subscribed'] as bool,
    json['creator'] == null
        ? null
        : NeaseUser.fromJson(json['creator'] as Map<String, dynamic>),
    (json['tracks'] as List)
        ?.map(
            (e) => e == null ? null : Track.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['trackIds'] as List)
        ?.map((e) =>
            e == null ? null : TrackId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['updateFrequency'] as String,
    json['backgroundCoverId'] as int,
    json['backgroundCoverUrl'] as String,
    json['titleImage'] as int,
    json['titleImageUrl'] as String,
    json['englishTitle'] as String,
    json['opRecommend'] as bool,
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    json['status'] as int,
    json['createTime'] as int,
    json['highQuality'] as bool,
    json['subscribedCount'] as int,
    json['cloudTrackCount'] as int,
    json['description'] as String,
    json['ordered'] as bool,
    json['playCount'] as int,
    json['trackNumberUpdateTime'] as int,
    json['newImported'] as bool,
    json['updateTime'] as int,
    json['specialType'] as int,
    json['trackCount'] as int,
    json['commentThreadId'] as String,
    json['privacy'] as int,
    json['trackUpdateTime'] as int,
    json['userId'] as int,
    json['coverImgUrl'] as String,
    json['coverImgId'] as int,
    json['coverImgId_str'] as String,
    json['adType'] as int,
    json['name'] as String,
    json['shareCount'] as int,
    json['commentCount'] as int,
  );
}

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'id': instance.id,
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'creator': instance.creator,
      'tracks': instance.tracks,
      'trackIds': instance.trackIds,
      'updateFrequency': instance.updateFrequency,
      'backgroundCoverId': instance.backgroundCoverId,
      'backgroundCoverUrl': instance.backgroundCoverUrl,
      'titleImage': instance.titleImage,
      'titleImageUrl': instance.titleImageUrl,
      'englishTitle': instance.englishTitle,
      'opRecommend': instance.opRecommend,
      'tags': instance.tags,
      'status': instance.status,
      'createTime': instance.createTime,
      'highQuality': instance.highQuality,
      'subscribedCount': instance.subscribedCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'description': instance.description,
      'ordered': instance.ordered,
      'playCount': instance.playCount,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'newImported': instance.newImported,
      'updateTime': instance.updateTime,
      'specialType': instance.specialType,
      'trackCount': instance.trackCount,
      'commentThreadId': instance.commentThreadId,
      'privacy': instance.privacy,
      'trackUpdateTime': instance.trackUpdateTime,
      'userId': instance.userId,
      'coverImgUrl': instance.coverImgUrl,
      'coverImgId': instance.coverImgId,
      'coverImgId_str': instance.coverImageId,
      'adType': instance.adType,
      'name': instance.name,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
    };

NeaseUser _$NeaseUserFromJson(Map<String, dynamic> json) {
  return NeaseUser(
    json['defaultAvatar'] as bool,
    json['province'] as int,
    json['authStatus'] as int,
    json['followed'] as bool,
    json['avatarUrl'] as String,
    json['accountStatus'] as int,
    json['gender'] as int,
    json['city'] as int,
    json['birthday'] as int,
    json['userId'] as int,
    json['userType'] as int,
    json['nickname'] as String,
    json['signature'] as String,
    json['description'] as String,
    json['detailDescription'] as String,
    json['avatarImgId'] as int,
    json['backgroundImgId'] as int,
    json['authority'] as int,
    json['mutual'] as bool,
    (json['expertTags'] as List)?.map((e) => e as String)?.toList(),
    json['experts'] as String,
    json['djStatus'] as int,
    json['vipType'] as int,
    json['remarkName'] as String,
    json['avatarImgIdStr'] as String,
    json['backgroundImgIdStr'] as String,
    json['avatarImgId_str'] as String,
  );
}

Map<String, dynamic> _$NeaseUserToJson(NeaseUser instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'expertTags': instance.expertTags,
      'experts': instance.experts,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'remarkName': instance.remarkName,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'avatarImgId_str': instance.avatarImageId,
    };

TrackId _$TrackIdFromJson(Map<String, dynamic> json) {
  return TrackId(
    json['id'] as int,
    json['v'] as int,
    json['alg'] as String,
  );
}

Map<String, dynamic> _$TrackIdToJson(TrackId instance) => <String, dynamic>{
      'id': instance.id,
      'v': instance.v,
      'alg': instance.alg,
    };

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
    json['id'] as int,
    json['name'] as String,
    json['pst'] as int,
    json['t'] as int,
    (json['ar'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['alia'] as List)?.map((e) => e as String)?.toList(),
    json['pop'] as int,
    json['st'] as int,
    json['rt'] as String,
    json['fee'] as int,
    json['v'] as int,
    json['crbt'] as String,
    json['cf'] as String,
    json['al'] == null
        ? null
        : Artist.fromJson(json['al'] as Map<String, dynamic>),
    json['dt'] as int,
    json['h'] == null ? null : Tone.fromJson(json['h'] as Map<String, dynamic>),
    json['m'] == null ? null : Tone.fromJson(json['m'] as Map<String, dynamic>),
    json['l'] == null ? null : Tone.fromJson(json['l'] as Map<String, dynamic>),
    json['a'] as String,
    json['cd'] as String,
    json['no'] as int,
    json['rtUrl'] as String,
    json['ftype'] as int,
    (json['rtUrls'] as List)?.map((e) => e as String)?.toList(),
    json['djId'] as int,
    json['copyright'] as int,
    json['s_id'] as int,
    json['mark'] as int,
    json['mv'] as int,
    json['rtype'] as int,
    json['rurl'] as String,
    json['cp'] as int,
    json['mst'] as int,
    json['publishTime'] as int,
    json['alg'] as String,
  );
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pst': instance.pst,
      't': instance.t,
      'ar': instance.ar,
      'alia': instance.alia,
      'pop': instance.pop,
      'st': instance.st,
      'rt': instance.rt,
      'fee': instance.fee,
      'v': instance.v,
      'crbt': instance.crbt,
      'cf': instance.cf,
      'al': instance.al,
      'dt': instance.dt,
      'h': instance.h,
      'm': instance.m,
      'l': instance.l,
      'a': instance.a,
      'cd': instance.cd,
      'no': instance.no,
      'rtUrl': instance.rtUrl,
      'ftype': instance.ftype,
      'rtUrls': instance.rtUrls,
      'djId': instance.djId,
      'copyright': instance.copyright,
      's_id': instance.sid,
      'mark': instance.mark,
      'mv': instance.mv,
      'rtype': instance.rtype,
      'rurl': instance.rurl,
      'cp': instance.cp,
      'mst': instance.mst,
      'publishTime': instance.publishTime,
      'alg': instance.alg,
    };

Tone _$ToneFromJson(Map<String, dynamic> json) {
  return Tone(
    json['br'] as int,
    json['fid'] as int,
    json['size'] as int,
    (json['vd'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ToneToJson(Tone instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
    json['id'] as int,
    json['name'] as String,
    json['picUrl'] as String,
    json['pic_str'] as String,
    json['pic'] as int,
    (json['tns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'pic_str': instance.picStr,
      'pic': instance.pic,
      'tns': instance.tns,
    };

Privilege _$PrivilegeFromJson(Map<String, dynamic> json) {
  return Privilege(
    json['id'] as int,
    json['fee'] as int,
    json['payed'] as int,
    json['st'] as int,
    json['pl'] as int,
    json['dl'] as int,
    json['sp'] as int,
    json['cp'] as int,
    json['subp'] as int,
    json['maxbr'] as int,
    json['fl'] as int,
    json['flag'] as int,
    json['cs'] as bool,
    json['toast'] as bool,
    json['preSell'] as bool,
  );
}

Map<String, dynamic> _$PrivilegeToJson(Privilege instance) => <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'payed': instance.payed,
      'st': instance.st,
      'pl': instance.pl,
      'dl': instance.dl,
      'sp': instance.sp,
      'cp': instance.cp,
      'subp': instance.subp,
      'maxbr': instance.maxbr,
      'fl': instance.fl,
      'flag': instance.flag,
      'cs': instance.cs,
      'toast': instance.toast,
      'preSell': instance.preSell,
    };
