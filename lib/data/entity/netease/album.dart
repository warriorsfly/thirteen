import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  const Album(
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.canDislike,
    this.trackNumberUpdateTime,
    this.trackCount,
    this.highQuality,
    this.alg, this.playCount,
  );
  final int id;
  final int type;
  final String name;
  final int playCount;
  final String copywriter;
  final String picUrl;
  final bool canDislike;
  final int trackNumberUpdateTime;
  final int trackCount;
  final bool highQuality;
  final String alg;

  String get play{ 
    var count =playCount~/10000;
    return '${count.toString()}万';
    }

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
