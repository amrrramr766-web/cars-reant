import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_entity.freezed.dart';

@freezed
class CarEntity with _$CarEntity {
  const CarEntity._(); // Required for methods

  const factory CarEntity({
    required int id,
    required String brand,
    required String model,
    required String year,
    required String imageUrl,
    required String plateNumber,
    required String gear,
    required String gas,
    required double pricePerDay,
    required int seat,
    required bool isAvailable,
    required bool isFavorite,
    required DateTime createdAt,
  }) = _CarEntity;

  // ===== Business Logic (UNCHANGED) =====

  double calculateRentalCost(int days) {
    if (days <= 0) return 0.0;
    return pricePerDay * days;
  }

  bool canBeRented() {
    return isAvailable && pricePerDay > 0;
  }

  bool isManual() => gear.toLowerCase() == 'manual';

  bool isAutomatic() => gear.toLowerCase() == 'automatic';

  String get fullName => '$brand $model ($year)';

  bool isSuitableForGroup() => seat >= 5;
}
