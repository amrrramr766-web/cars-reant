import 'package:car_rent/Domain%20Layer/Entities/booking_entity.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';

class BookingUseCase {
  final IBookingRepository repository;

  BookingUseCase(this.repository);

  Future<Either<Failure, BookingEntity>> createBooking({
    required int userId,
    required int carId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // Business logic validation
    if (carId <= 0) {
      return Left(ValidationFailure('Invalid car ID'));
    }
    if (startDate.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return Left(ValidationFailure('Start date cannot be in the past'));
    }
    if (endDate.isBefore(startDate)) {
      return Left(ValidationFailure('End date must be after start date'));
    }
    // Delegate to repository
    return await repository.createBooking(
      userId: userId,
      carId: carId,
      totalPrice: totalPrice,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
