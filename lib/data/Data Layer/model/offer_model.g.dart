// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      description: json['discreption'] as String? ?? '',
      persenteg: (json['persenteg'] as num?)?.toInt() ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discreption': instance.description,
      'persenteg': instance.persenteg,
      'imageUrl': instance.imageUrl,
      'endDate': instance.endDate.toIso8601String(),
    };
