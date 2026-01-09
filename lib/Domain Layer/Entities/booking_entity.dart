import 'package:equatable/equatable.dart';

/// Booking Entity - Pure business object without JSON dependencies
class BookingEntity extends Equatable {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;
  final BookingStatus status;
  final String brand;
  final String model;
  final int userId;
  final int carId;

  const BookingEntity({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.brand,
    required this.model,
    required this.status,
    required this.userId,
    required this.carId,
  });

  // Business logic methods

  /// Gets the number of rental days
  int get rentalDays {
    return endDate.difference(startDate).inDays;
  }

  /// Checks if the booking is currently active
  bool isActive() {
    final now = DateTime.now();
    return status == BookingStatus.confirmed &&
        now.isAfter(startDate) &&
        now.isBefore(endDate);
  }

  /// Checks if the booking is upcoming
  bool isUpcoming() {
    return status == BookingStatus.confirmed &&
        DateTime.now().isBefore(startDate);
  }

  /// Checks if the booking is completed
  bool isCompleted() {
    return status == BookingStatus.completed ||
        (status == BookingStatus.confirmed && DateTime.now().isAfter(endDate));
  }

  /// Checks if the booking can be cancelled
  bool canBeCancelled() {
    return (status == BookingStatus.pending ||
            status == BookingStatus.confirmed) &&
        DateTime.now().isBefore(startDate);
  }

  /// Gets the price per day
  double get pricePerDay {
    if (rentalDays <= 0) return 0.0;
    return totalPrice / rentalDays;
  }

  /// Checks if booking starts today
  bool startsToday() {
    final now = DateTime.now();
    return startDate.year == now.year &&
        startDate.month == now.month &&
        startDate.day == now.day;
  }

  /// Checks if booking ends today
  bool endsToday() {
    final now = DateTime.now();
    return endDate.year == now.year &&
        endDate.month == now.month &&
        endDate.day == now.day;
  }

  /// Gets days until booking starts (negative if already started)
  int daysUntilStart() {
    return startDate.difference(DateTime.now()).inDays;
  }

  @override
  List<Object?> get props => [
    id,
    startDate,
    endDate,
    totalPrice,
    status,
    userId,
    carId,
  ];
}

/// Booking status enumeration
enum BookingStatus {
  pending('pending'),
  confirmed('confirmed'),
  cancelled('cancelled'),
  completed('completed');

  final String value;
  const BookingStatus(this.value);

  static BookingStatus fromString(String value) {
    return BookingStatus.values.firstWhere(
      (status) => status.value == value.toLowerCase(),
      orElse: () => BookingStatus.pending,
    );
  }
}
