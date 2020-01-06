import 'package:json_annotation/json_annotation.dart';
import 'package:thirteen/data/entity/netease/album.dart';
part 'personalized.g.dart';

@JsonSerializable()
class Personalized {
  const Personalized({
    this.hasTaste,
    this.code,
    this.category,
    this.result,
  });
  final bool hasTaste;
  final int code;
  final int category;
  final List<Album> result;

  factory Personalized.fromJson(Map<String, dynamic> json) => _$PersonalizedFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalizedToJson(this);
}
