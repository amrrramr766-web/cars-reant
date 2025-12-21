import 'package:equatable/equatable.dart';

/// License Entity - Pure business object without JSON dependencies
class LicenseEntity extends Equatable {
  final int id;
  final String licenseNumber;
  final DateTime expiryDate;
  final String address;

  const LicenseEntity({
    required this.id,
    required this.licenseNumber,
    required this.expiryDate,
    required this.address,
  });

  // Business logic methods

  /// Checks if the license is expired
  bool isExpired() {
    return DateTime.now().isAfter(expiryDate);
  }

  /// Checks if the license is valid (not expired and has valid number)
  bool isValid() {
    return !isExpired() && licenseNumber.isNotEmpty;
  }

  /// Checks if the license will expire soon (within 30 days)
  bool willExpireSoon() {
    final daysUntilExpiry = expiryDate.difference(DateTime.now()).inDays;
    return daysUntilExpiry > 0 && daysUntilExpiry <= 30;
  }

  /// Gets the number of days until expiry (negative if expired)
  int daysUntilExpiry() {
    return expiryDate.difference(DateTime.now()).inDays;
  }

  /// Checks if license is valid for rental (not expired and at least 7 days remaining)
  bool isValidForRental() {
    return isValid() && daysUntilExpiry() >= 7;
  }

  @override
  List<Object?> get props => [id, licenseNumber, expiryDate, address];
}
