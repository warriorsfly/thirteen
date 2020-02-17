import 'package:json_annotation/json_annotation.dart';
import 'package:thirteen/data/entity/netease/album.dart';
part 'personalized.g.dart';

@JsonSerializable()
class Personalized {
  const Personalized({
    this.hasTaste,
    this.code,
    this.category,
    this.data,
  });
  final bool hasTaste;
  final int code;
  final int category;
  @JsonKey(name: 'result')
  final List<Album> data;

  factory Personalized.fromJson(Map<String, dynamic> json) =>
      _$PersonalizedFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedToJson(this);
}
