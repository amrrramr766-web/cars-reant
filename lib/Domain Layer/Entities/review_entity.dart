import 'package:equatable/equatable.dart';

/// Review Entity - Pure business object without JSON dependencies
class Review extends Equatable {
  final int id;
  final int carId;
  final int userId;
  final int stars;
  final String reviewText;
  final DateTime createdAt;
  final String? userFullName;
  final String? carBrand;
  final String? carModel;

  const Review({
    required this.id,
    required this.carId,
    required this.userId,
    required this.stars,
    required this.reviewText,
    required this.createdAt,
    this.userFullName,
    this.carBrand,
    this.carModel,
  });

  // Business logic methods

  /// Checks if the review is positive (4-5 stars)
  bool isPositive() {
    return stars >= 4;
  }

  /// Checks if the review is negative (1-2 stars)
  bool isNegative() {
    return stars <= 2;
  }

  /// Checks if the review is neutral (3 stars)
  bool isNeutral() {
    return stars == 3;
  }

  /// Checks if the review is recent (within last 7 days)
  bool isRecent() {
    final daysSinceReview = DateTime.now().difference(createdAt).inDays;
    return daysSinceReview <= 7;
  }

  /// Gets the rating as a percentage (0-100)
  double get ratingPercentage {
    return (stars / 5.0) * 100;
  }

  /// Gets the car's full name if available
  String? get carFullName {
    if (carBrand != null && carModel != null) {
      return '$carBrand $carModel';
    }
    return null;
  }

  /// Checks if review has detailed text (more than 20 characters)
  bool hasDetailedReview() {
    return reviewText.trim().length > 20;
  }

  @override
  List<Object?> get props => [
    id,
    carId,
    userId,
    stars,
    reviewText,
    createdAt,
    userFullName,
    carBrand,
    carModel,
  ];
}
