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
    // Attempt to parse itemName like "Brand Model Year"
    String brand = '';
    String model = '';
    String year = '';

    if (itemName != null && itemName!.isNotEmpty) {
      final parts = itemName!.split(' ');
      if (parts.length >= 2) {
        brand = parts[0]; // first word as brand
        year = parts.last; // last word as year
        model = parts.sublist(1, parts.length - 1).join(' '); // middle as model
      } else {
        brand = itemName!;
      }
    }

    return CarModel(
      carID: itemID,
      brand: brand,
      model: model,
      year: year,
      imageUrl: imageURL, // <-- maps correctly to CarListCard
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
