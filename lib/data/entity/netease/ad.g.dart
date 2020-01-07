// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) {
  return Ad(
    imageUrl: json['imageUrl'] as String,
    pic: json['pic'] as String,
    targetId: json['targetId'] as int,
    targetType: json['targetType'] as int,
    adid: json['adid'] as int,
    titleColor: json['titleColor'] as String,
    typeTitle: json['typeTitle'] as String,
    url: json['url'] as String,
    adurlV2: json['adurlV2'] as String,
    exclusive: json['exclusive'] as bool,
    monitorImpress: json['monitorImpress'] as String,
    monitorClick: json['monitorClick'] as String,
    monitorType: json['monitorType'] as String,
    monitorImpressList:
        (json['monitorImpressList'] as List)?.map((e) => e as String)?.toList(),
    monitorClickList:
        (json['monitorClickList'] as List)?.map((e) => e as String)?.toList(),
    monitorBlackList:
        (json['monitorBlackList'] as List)?.map((e) => e as String)?.toList(),
    extMonitor: json['extMonitor'] as String,
    extMonitorInfo: json['extMonitorInfo'] as String,
    adSource: json['adSource'] as String,
    adLocation: json['adLocation'] as String,
    encodeId: json['encodeId'] as String,
    program: json['program'] as String,
    event: json['event'] as String,
    video: json['video'] as String,
    dynamicVideoData: json['dynamicVideoData'] as String,
    song: json['song'] == null
        ? null
        : Song.fromJson(json['song'] as Map<String, dynamic>),
    bannerId: json['bannerId'] as String,
    alg: json['alg'] as String,
    scm: json['scm'] as String,
    requestId: json['requestId'] as String,
    showAdTag: json['showAdTag'] as bool,
    pid: json['pid'] as String,
    showContext: json['showContext'] as String,
    adDispatchJson: json['adDispatchJson'] as String,
  );
}

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'pic': instance.pic,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'adid': instance.adid,
      'titleColor': instance.titleColor,
      'typeTitle': instance.typeTitle,
      'url': instance.url,
      'adurlV2': instance.adurlV2,
      'exclusive': instance.exclusive,
      'monitorImpress': instance.monitorImpress,
      'monitorClick': instance.monitorClick,
      'monitorType': instance.monitorType,
      'monitorImpressList': instance.monitorImpressList,
      'monitorClickList': instance.monitorClickList,
      'monitorBlackList': instance.monitorBlackList,
      'extMonitor': instance.extMonitor,
      'extMonitorInfo': instance.extMonitorInfo,
      'adSource': instance.adSource,
      'adLocation': instance.adLocation,
      'encodeId': instance.encodeId,
      'program': instance.program,
      'event': instance.event,
      'video': instance.video,
      'dynamicVideoData': instance.dynamicVideoData,
      'song': instance.song,
      'bannerId': instance.bannerId,
      'alg': instance.alg,
      'scm': instance.scm,
      'requestId': instance.requestId,
      'showAdTag': instance.showAdTag,
      'pid': instance.pid,
      'showContext': instance.showContext,
      'adDispatchJson': instance.adDispatchJson,
    };

ResponseAds _$ResponseAdsFromJson(Map<String, dynamic> json) {
  return ResponseAds(
    code: json['code'] as int,
    ads: (json['banners'] as List)
        ?.map((e) => e == null ? null : Ad.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseAdsToJson(ResponseAds instance) =>
    <String, dynamic>{
      'code': instance.code,
      'banners': instance.ads,
    };
