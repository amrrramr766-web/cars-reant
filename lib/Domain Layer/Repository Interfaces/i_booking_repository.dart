import 'package:car_rent/Domain%20Layer/Entities/booking_entity.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';

abstract class IBookingRepository {
  /// Creates a new booking
  Future<Either<Failure, BookingEntity>> createBooking({
    required int userId,
    required int carId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Gets all bookings for the current user
  Future<Either<Failure, List<BookingEntity>>> getUserBookings(int userId);

  /// Cancels a booking
  Future<Either<Failure, void>> cancelBooking(int bookingId);

  /// Gets booking details
  Future<Either<Failure, List<BookingEntity>>> getBookingById(int id);
}
