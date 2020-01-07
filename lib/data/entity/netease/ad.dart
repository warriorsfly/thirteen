import 'package:json_annotation/json_annotation.dart';
import 'package:thirteen/data/entity/netease/song.dart';

part 'ad.g.dart';

@JsonSerializable()
class Ad {
  const Ad({
    this.imageUrl,
    this.pic,
    this.targetId,
    this.targetType,
    this.adid,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.adurlV2,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.dynamicVideoData,
    this.song,
    this.bannerId,
    this.alg,
    this.scm,
    this.requestId,
    this.showAdTag,
    this.pid,
    this.showContext,
    this.adDispatchJson,
  });

  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'pic')
  final String pic;
  @JsonKey(name: 'targetId')
  final int targetId;
  @JsonKey(name: 'targetType')
  final int targetType;
  @JsonKey(name: 'adid')
  final int adid;
  @JsonKey(name: 'titleColor')
  final String titleColor;
  @JsonKey(name: 'typeTitle')
  final String typeTitle;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'adurlV2')
  final String adurlV2;
  @JsonKey(name: 'exclusive')
  final bool exclusive;
  @JsonKey(name: 'monitorImpress')
  final String monitorImpress;
  @JsonKey(name: 'monitorClick')
  final String monitorClick;
  @JsonKey(name: 'monitorType')
  final String monitorType;
  @JsonKey(name: 'monitorImpressList')
  final List<String> monitorImpressList;
  @JsonKey(name: 'monitorClickList')
  final List<String> monitorClickList;
  @JsonKey(name: 'monitorBlackList')
  final List<String> monitorBlackList;
  @JsonKey(name: 'extMonitor')
  final String extMonitor;
  @JsonKey(name: 'extMonitorInfo')
  final String extMonitorInfo;
  @JsonKey(name: 'adSource')
  final String adSource;
  @JsonKey(name: 'adLocation')
  final String adLocation;
  @JsonKey(name: 'encodeId')
  final String encodeId;
  @JsonKey(name: 'program')
  final String program;
  @JsonKey(name: 'event')
  final String event;
  @JsonKey(name: 'video')
  final String video;
  @JsonKey(name: 'dynamicVideoData')
  final String dynamicVideoData;
  final Song song;
  @JsonKey(name: 'bannerId')
  final String bannerId;
  @JsonKey(name: 'alg')
  final String alg;
  @JsonKey(name: 'scm')
  final String scm;
  @JsonKey(name: 'requestId')
  final String requestId;
  @JsonKey(name: 'showAdTag')
  final bool showAdTag;
  @JsonKey(name: 'pid')
  final String pid;
  @JsonKey(name: 'showContext')
  final String showContext;
  @JsonKey(name: 'adDispatchJson')
  final String adDispatchJson;

  factory Ad.fromJson(Map<String, dynamic> json) =>
      _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}

@JsonSerializable()
class ResponseAds {
  const ResponseAds({
    this.code,
    this.ads,
  });
  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'banners')
  final List<Ad> ads;

  factory ResponseAds.fromJson(Map<String, dynamic> json) =>
      _$ResponseAdsFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseAdsToJson(this);
}
