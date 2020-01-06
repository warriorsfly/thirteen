// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personalized _$PersonalizedFromJson(Map<String, dynamic> json) {
  return Personalized(
    hasTaste: json['hasTaste'] as bool,
    code: json['code'] as int,
    category: json['category'] as int,
    result: (json['result'] as List)
        ?.map(
            (e) => e == null ? null : Album.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PersonalizedToJson(Personalized instance) =>
    <String, dynamic>{
      'hasTaste': instance.hasTaste,
      'code': instance.code,
      'category': instance.category,
      'result': instance.result,
    };
