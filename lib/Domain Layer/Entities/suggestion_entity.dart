import 'package:equatable/equatable.dart';

/// Suggestion Entity - Pure business object without JSON dependencies
class Suggestion extends Equatable {
  final int id;
  final String title;
  final int carId;
  final double pricePerDay;
  final String category;
  final bool isActive;
  final DateTime createdAt;
  final String carName;

  const Suggestion({
    required this.id,
    required this.title,
    required this.carId,
    required this.pricePerDay,
    required this.category,
    required this.isActive,
    required this.createdAt,
    required this.carName,
  });

  // Business logic methods

  /// Checks if the suggestion is currently active
  bool canBeDisplayed() {
    return isActive;
  }

  /// Checks if this is a new suggestion (created within last 7 days)
  bool isNew() {
    final daysSinceCreation = DateTime.now().difference(createdAt).inDays;
    return daysSinceCreation <= 7;
  }

  /// Checks if the price is affordable (less than 100 per day)
  bool isAffordable() {
    return pricePerDay < 100;
  }

  /// Checks if this is a premium suggestion (price >= 150 per day)
  bool isPremium() {
    return pricePerDay >= 150;
  }

  /// Gets the category type
  SuggestionCategory getCategoryType() {
    switch (category.toLowerCase()) {
      case 'luxury':
        return SuggestionCategory.luxury;
      case 'suv':
        return SuggestionCategory.suv;
      case 'sedan':
        return SuggestionCategory.sedan;
      case 'sports':
        return SuggestionCategory.sports;
      case 'economy':
        return SuggestionCategory.economy;
      default:
        return SuggestionCategory.other;
    }
  }

  @override
  List<Object?> get props => [
    id,
    title,
    carId,
    pricePerDay,
    category,
    isActive,
    createdAt,
    carName,
  ];
}

/// Suggestion category enumeration
enum SuggestionCategory { luxury, suv, sedan, sports, economy, other }
