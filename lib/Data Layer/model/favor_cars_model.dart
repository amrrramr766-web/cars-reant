import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';

part 'favor_cars_model.freezed.dart';
part 'favor_cars_model.g.dart';

@freezed
class FavorCarsModel with _$FavorCarsModel {
  const FavorCarsModel._(); // Required for custom methods

  const factory FavorCarsModel({
    int? favoriteID,
    int? userID,
    int? itemID,
    String? createdAt,
    String? itemName,
    double? pricePerDay,
    bool? isAvailable,
    bool? isFave,
    String? imageURL,
    String? gas,
    String? gear,
    int? seat,
  }) = _FavorCarsModel;

  factory FavorCarsModel.fromJson(Map<String, dynamic> json) =>
      _$FavorCarsModelFromJson(json);

  /// Mapper: Favorite → CarModel
  CarModel toCarModel() {
    return CarModel(
      carID: itemID,
      brand: itemName,
      model: '',
      year: '',
      imageUrl: imageURL,
      plateNumber: '',
      gear: gear,
      gas: gas,
      pricePerDay: pricePerDay,
      seat: seat,
      isAvailable: isAvailable,
      isFave: isFave,
      createdAt: createdAt,
    );
  }
}
