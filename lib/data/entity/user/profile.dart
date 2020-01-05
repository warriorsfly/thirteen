import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  const Profile({
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.description,
    this.userId,
    this.vipType,
    this.gender,
    this.defaultAvatar,
    this.avatarUrl,
    this.city,
    this.userType,
    this.backgroundImgId,
    this.province,
    this.djStatus,
    this.experts,
    this.mutual,
    this.remarkName,
    this.expertTags,
    this.authStatus,
    this.accountStatus,
    this.nickname,
    this.birthday,
    this.avatarImgId,
    this.detailDescription,
    this.followed,
    this.backgroundUrl,
    this.signature,
    this.authority,
    this.followeds,
    this.follows,
    this.eventCount,
    this.playlistCount,
    this.playlistBeSubscribedCount,
  });

  final String avatarImgIdStr; // 1371091000469421
  final String backgroundImgIdStr; // 18864320998031106
  final String description; //
  final String userId; // 130680472,
  final int vipType; // 0,
  final int gender; // 1,
  final bool defaultAvatar; // false,
  final String
      avatarUrl; // https://p4.music.126.net/N-hlDRfvXjw-1ULkBCuIow==/1371091000469421.jpg
  final String city; // 340100,
  final int userType; // 0,
  final String backgroundImgId; // 18864320998031104,
  final int province; // 340000,
  final int djStatus; // 0,
  final Object experts;
  final bool mutual; // false,
  final String remarkName; // null,
  final String expertTags; // null,
  final int authStatus; // 0,
  final int accountStatus; // 0,
  final String nickname; // Warriorsfly
  final String birthday; // 599414400000,
  final String avatarImgId; // 1371091000469421,
  final String detailDescription; //
  final bool followed; // false,
  final String
      backgroundUrl; // https://p1.music.126.net/B6wtJEJtIGU59b3e4_R18A==/18864320998031106.jpg
  final String signature; // 爱老婆和果冬
  final int authority; // 0,
  final int followeds; // 3,
  final int follows; // 14,
  final int eventCount; // 5,
  final int playlistCount; // 16,
  final int playlistBeSubscribedCount; // 1

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
