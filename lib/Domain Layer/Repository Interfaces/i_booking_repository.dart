import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/booking_model.dart';
import 'package:dartz/dartz.dart';

abstract class IBookingRepository {
  /// Creates a new booking
  Future<Either<Failure, BookingModel>> createBooking({
    required int userId,
    required int carId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  });

  /// Gets all bookings for the current user
  Future<Either<Failure, List<BookingModel>>> getUserBookings(int userId);

  /// Cancels a booking
  Future<Either<Failure, void>> cancelBooking(int bookingId);

  /// Gets booking details
  Future<Either<Failure, List<BookingModel>>> getBookingById(int id);
}
