import 'package:json_annotation/json_annotation.dart';
part 'album_detail.g.dart';

@JsonSerializable()
class AlbumDetail {
  final int code;
  final List<String> relatedVideos;
  final PlayList playlist;
  final List<String> urls;
  final List<Privilege> privileges;

  AlbumDetail(
      this.code, this.relatedVideos, this.playlist, this.urls, this.privileges);

  factory AlbumDetail.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDetailToJson(this);
}

@JsonSerializable()
class PlayList {
  final int id;
  final List<NeaseUser> subscribers;
  final bool subscribed;
  final NeaseUser creator;
  final List<Track> tracks;
  final List<TrackId> trackIds;
  final String updateFrequency;
  final int backgroundCoverId;
  final String backgroundCoverUrl;
  final int titleImage;
  final String titleImageUrl;
  final String englishTitle;
  final bool opRecommend;
  final List<String> tags;
  final int status;
  final int createTime;
  final bool highQuality;
  final int subscribedCount;
  final int cloudTrackCount;
  final String description;
  final bool ordered;

  /// 播放次数
  final int playCount;
  final int trackNumberUpdateTime;
  final bool newImported;
  final int updateTime;
  final int specialType;
  final int trackCount;
  final String commentThreadId;
  final int privacy;
  final int trackUpdateTime;
  final int userId;

  /// 封面图片
  final String coverImgUrl;
  final int coverImgId;

  @JsonKey(name: 'coverImgId_str')
  final String coverImageId;
  final int adType;
  final String name;

  /// 分享次数
  final int shareCount;

  /// 评论数
  final int commentCount;

  PlayList(
      this.id,
      this.subscribers,
      this.subscribed,
      this.creator,
      this.tracks,
      this.trackIds,
      this.updateFrequency,
      this.backgroundCoverId,
      this.backgroundCoverUrl,
      this.titleImage,
      this.titleImageUrl,
      this.englishTitle,
      this.opRecommend,
      this.tags,
      this.status,
      this.createTime,
      this.highQuality,
      this.subscribedCount,
      this.cloudTrackCount,
      this.description,
      this.ordered,
      this.playCount,
      this.trackNumberUpdateTime,
      this.newImported,
      this.updateTime,
      this.specialType,
      this.trackCount,
      this.commentThreadId,
      this.privacy,
      this.trackUpdateTime,
      this.userId,
      this.coverImgUrl,
      this.coverImgId,
      this.coverImageId,
      this.adType,
      this.name,
      this.shareCount,
      this.commentCount);

  factory PlayList.fromJson(Map<String, dynamic> json) =>
      _$PlayListFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListToJson(this);
}

/// 网易用户
@JsonSerializable()
class NeaseUser {
  final bool defaultAvatar;
  final int province;
  final int authStatus;
  final bool followed;
  final String avatarUrl;
  final int accountStatus;
  final int gender;
  final int city;
  final int birthday;
  final int userId;
  final int userType;
  final String nickname;
  final String signature;
  final String description;
  final String detailDescription;
  final int avatarImgId;
  final int backgroundImgId;
  final int authority;
  final bool mutual;
  final List<String> expertTags;
  // final Map<String,String> experts;
  final int djStatus;
  final int vipType;
  final String remarkName;
  final String avatarImgIdStr;
  final String backgroundImgIdStr;

  @JsonKey(name: 'avatarImgId_str')
  final String avatarImageId;

  NeaseUser(
      this.defaultAvatar,
      this.province,
      this.authStatus,
      this.followed,
      this.avatarUrl,
      this.accountStatus,
      this.gender,
      this.city,
      this.birthday,
      this.userId,
      this.userType,
      this.nickname,
      this.signature,
      this.description,
      this.detailDescription,
      this.avatarImgId,
      this.backgroundImgId,
      this.authority,
      this.mutual,
      this.expertTags,
      this.djStatus,
      this.vipType,
      this.remarkName,
      this.avatarImgIdStr,
      this.backgroundImgIdStr,
      this.avatarImageId);

  factory NeaseUser.fromJson(Map<String, dynamic> json) =>
      _$NeaseUserFromJson(json);

  Map<String, dynamic> toJson() => _$NeaseUserToJson(this);
}

// @JsonSerializable()
// class Url {}
@JsonSerializable()
class TrackId {
  final int id;
  final int v;
  final String alg;

  TrackId(this.id, this.v, this.alg);

  factory TrackId.fromJson(Map<String, dynamic> json) =>
      _$TrackIdFromJson(json);

  Map<String, dynamic> toJson() => _$TrackIdToJson(this);
}

/// 音轨
@JsonSerializable()
class Track {
  final int id;
  final String name;
  final int pst;
  final int t;
  final List<Artist> ar;
  final List<String> alia;
  final int pop;
  final int st;
  final String rt;
  final int fee;
  final int v;
  final String crbt;
  final String cf;
  final Artist al;
  final int dt;
  final Tone h;
  final Tone m;
  final Tone l;
  final String a;
  final String cd;
  final int no;
  final String rtUrl;
  final int ftype;
  final List<String> rtUrls;
  final int djId;
  final int copyright;
  @JsonKey(name: 's_id')
  final int sid;
  final int mark;
  final int mv;
  final int rtype;
  final String rurl;
  final int cp;
  final int mst;
  final int publishTime;
  final String alg;

  Track(
      this.id,
      this.name,
      this.pst,
      this.t,
      this.ar,
      this.alia,
      this.pop,
      this.st,
      this.rt,
      this.fee,
      this.v,
      this.crbt,
      this.cf,
      this.al,
      this.dt,
      this.h,
      this.m,
      this.l,
      this.a,
      this.cd,
      this.no,
      this.rtUrl,
      this.ftype,
      this.rtUrls,
      this.djId,
      this.copyright,
      @JsonKey(name: 's_id') this.sid,
      this.mark,
      this.mv,
      this.rtype,
      this.rurl,
      this.cp,
      this.mst,
      this.publishTime,
      this.alg);

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}

/// 音质
@JsonSerializable()
class Tone {
  final int br;
  final int fid;
  final int size;
  final double vd;

  Tone(this.br, this.fid, this.size, this.vd);

  factory Tone.fromJson(Map<String, dynamic> json) => _$ToneFromJson(json);

  Map<String, dynamic> toJson() => _$ToneToJson(this);
}

/// 作者或AL是啥
@JsonSerializable()
class Artist {
  final int id;
  final String name;
  final String picUrl;

  @JsonKey(name: 'pic_str')
  final String picStr;
  final int pic;
  final List<String> tns;

  Artist(this.id, this.name, this.picUrl, this.picStr, this.pic, this.tns);

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}

/// 特权
@JsonSerializable()
class Privilege {
  final int id;
  final int fee;
  final int payed;
  final int st;
  final int pl;
  final int dl;
  final int sp;
  final int cp;
  final int subp;
  final int maxbr;
  final int fl;
  final int flag;
  final bool cs;
  final bool toast;
  final bool preSell;

  Privilege(
      this.id,
      this.fee,
      this.payed,
      this.st,
      this.pl,
      this.dl,
      this.sp,
      this.cp,
      this.subp,
      this.maxbr,
      this.fl,
      this.flag,
      this.cs,
      this.toast,
      this.preSell);

  factory Privilege.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeToJson(this);
}
