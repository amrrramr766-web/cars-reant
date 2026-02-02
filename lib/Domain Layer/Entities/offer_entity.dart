import 'package:equatable/equatable.dart';

/// Offer Entity - Pure business object without JSON dependencies
class Offer extends Equatable {
  final int id;
  final String description;
  final int discountPercentage;
  final String imageUrl;
  final DateTime endDate;

  const Offer({
    required this.id,
    required this.description,
    required this.discountPercentage,
    required this.imageUrl,
    required this.endDate,
  });

  // Business logic methods

  /// Checks if the offer is still valid (not expired)
  bool isValid() {
    return DateTime.now().isBefore(endDate);
  }

  /// Checks if the offer is expired
  bool isExpired() {
    return DateTime.now().isAfter(endDate);
  }

  /// Gets the number of days remaining for the offer
  int daysRemaining() {
    if (isExpired()) return 0;
    return endDate.difference(DateTime.now()).inDays;
  }

  /// Checks if the offer expires soon (within 3 days)
  bool expiresSoon() {
    return isValid() && daysRemaining() <= 3;
  }

  /// Calculates the discounted price from an original price
  double calculateDiscountedPrice(double originalPrice) {
    if (originalPrice <= 0 || !isValid()) return originalPrice;
    final discount = originalPrice * (discountPercentage / 100);
    return originalPrice - discount;
  }

  /// Gets the discount amount for a given price
  double getDiscountAmount(double originalPrice) {
    if (originalPrice <= 0 || !isValid()) return 0.0;
    return originalPrice * (discountPercentage / 100);
  }

  /// Checks if this is a significant discount (>= 20%)
  bool isSignificantDiscount() {
    return discountPercentage >= 20;
  }

  @override
  List<Object?> get props => [
    id,
    description,
    discountPercentage,
    imageUrl,
    endDate,
  ];
}
