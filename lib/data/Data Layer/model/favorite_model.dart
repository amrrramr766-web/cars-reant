import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
    int? favoriteID,
    int? userID,
    int? itemID,
    String? createdAt,
    String? itemName,
    num? pricePerDay,
    bool? isAvailable,
    String? imageURL,
    String? gas,
    String? gear,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}
