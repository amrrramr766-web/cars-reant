// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviwe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      reviewId: (json['reviewId'] as num).toInt(),
      carId: (json['carId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      stars: (json['stars'] as num).toInt(),
      review: json['review'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userFullName: json['userFullName'] as String?,
      carBrand: json['carBrand'] as String?,
      carModel: json['carModel'] as String?,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'carId': instance.carId,
      'userId': instance.userId,
      'stars': instance.stars,
      'review': instance.review,
      'createdAt': instance.createdAt.toIso8601String(),
      'userFullName': instance.userFullName,
      'carBrand': instance.carBrand,
      'carModel': instance.carModel,
    };
