// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionsModelImpl _$$SuggestionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestionsModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      carId: (json['carId'] as num?)?.toInt(),
      presPerDay: (json['presPerDay'] as num?)?.toDouble(),
      category: json['category'] as String?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      carName: json['carName'] as String?,
    );

Map<String, dynamic> _$$SuggestionsModelImplToJson(
        _$SuggestionsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'carId': instance.carId,
      'presPerDay': instance.presPerDay,
      'category': instance.category,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'carName': instance.carName,
    };
