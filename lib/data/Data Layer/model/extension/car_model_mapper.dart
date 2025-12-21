import 'package:car_rent/data/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Domain Layer/Entities/car_entity.dart';

extension CarModelMapper on CarModel {
  CarEntity toEntity() {
    return CarEntity(
      id: carID ?? 0,
      brand: brand ?? '',
      model: model ?? '',
      year: year ?? '',
      imageUrl: imageUrl ?? '',
      plateNumber: plateNumber ?? '',
      gear: gear ?? '',
      gas: gas ?? '',
      pricePerDay: pricePerDay ?? 0.0,
      seat: seat ?? 0,
      isAvailable: isAvailable ?? false,
      isFavorite: isFave ?? false,
      createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime.now(),
    );
  }
}
