import 'package:equatable/equatable.dart';

/// Car Entity - Pure business object without JSON dependencies
class Car extends Equatable {
  final int id;
  final String brand;
  final String model;
  final String year;
  final String imageUrl;
  final String plateNumber;
  final String gear;
  final String gas;
  final double pricePerDay;
  final int seat;
  final bool isAvailable;
  final bool isFavorite;
  final DateTime createdAt;

  const Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.imageUrl,
    required this.plateNumber,
    required this.gear,
    required this.gas,
    required this.pricePerDay,
    required this.seat,
    required this.isAvailable,
    required this.isFavorite,
    required this.createdAt,
  });

  // Business logic methods

  /// Calculates the total rental cost for a given number of days
  double calculateRentalCost(int days) {
    if (days <= 0) return 0.0;
    return pricePerDay * days;
  }

  /// Checks if the car can be rented
  bool canBeRented() {
    return isAvailable && pricePerDay > 0;
  }

  /// Checks if the car is a manual transmission
  bool isManual() {
    return gear.toLowerCase() == 'manual';
  }

  /// Checks if the car is automatic transmission
  bool isAutomatic() {
    return gear.toLowerCase() == 'automatic';
  }

  /// Gets the car's full display name
  String get fullName => '$brand $model ($year)';

  /// Checks if the car is suitable for a group (5+ seats)
  bool isSuitableForGroup() {
    return seat >= 5;
  }

  @override
  List<Object?> get props => [
    id,
    brand,
    model,
    year,
    imageUrl,
    plateNumber,
    gear,
    gas,
    pricePerDay,
    seat,
    isAvailable,
    isFavorite,
    createdAt,
  ];
}
