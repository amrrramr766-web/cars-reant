import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/booking_model.dart';
import 'package:dartz/dartz.dart';

class BookingUseCase {
  final IBookingRepository repository;

  BookingUseCase(this.repository);

  Future<Either<Failure, BookingModel>> createBooking({
    required int userId,
    required int carId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    // Business logic validation
    if (carId > 0 || startDate == DateTime.now() || endDate == DateTime.now()) {
      return Left(ValidationFailure('All fields are required'));
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
