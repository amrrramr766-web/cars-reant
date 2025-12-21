// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      favoriteID: (json['favoriteID'] as num?)?.toInt(),
      userID: (json['userID'] as num?)?.toInt(),
      itemID: (json['itemID'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      itemName: json['itemName'] as String?,
      pricePerDay: json['pricePerDay'] as num?,
      isAvailable: json['isAvailable'] as bool?,
      imageURL: json['imageURL'] as String?,
      gas: json['gas'] as String?,
      gear: json['gear'] as String?,
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'favoriteID': instance.favoriteID,
      'userID': instance.userID,
      'itemID': instance.itemID,
      'createdAt': instance.createdAt,
      'itemName': instance.itemName,
      'pricePerDay': instance.pricePerDay,
      'isAvailable': instance.isAvailable,
      'imageURL': instance.imageURL,
      'gas': instance.gas,
      'gear': instance.gear,
    };
