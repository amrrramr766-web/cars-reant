// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favor_cars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavorCarsModelImpl _$$FavorCarsModelImplFromJson(Map<String, dynamic> json) =>
    _$FavorCarsModelImpl(
      favoriteID: (json['favoriteID'] as num?)?.toInt(),
      userID: (json['userID'] as num?)?.toInt(),
      itemID: (json['itemID'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      itemName: json['itemName'] as String?,
      pricePerDay: (json['pricePerDay'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool?,
      isFave: json['isFave'] as bool?,
      imageURL: json['imageURL'] as String?,
      gas: json['gas'] as String?,
      gear: json['gear'] as String?,
      seat: (json['seat'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FavorCarsModelImplToJson(
        _$FavorCarsModelImpl instance) =>
    <String, dynamic>{
      'favoriteID': instance.favoriteID,
      'userID': instance.userID,
      'itemID': instance.itemID,
      'createdAt': instance.createdAt,
      'itemName': instance.itemName,
      'pricePerDay': instance.pricePerDay,
      'isAvailable': instance.isAvailable,
      'isFave': instance.isFave,
      'imageURL': instance.imageURL,
      'gas': instance.gas,
      'gear': instance.gear,
      'seat': instance.seat,
    };
