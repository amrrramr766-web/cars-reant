import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/booking_remote_data_source.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/booking_model.dart';
import 'package:dartz/dartz.dart';

class BookingRepository implements IBookingRepository {
  final BookingRemoteDataSource remoteDataSource;
  BookingRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, BookingModel>> cancelBooking(int bookingId) {
    // TODO: implement cancelBooking
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BookingModel>> createBooking({
    required int userId,
    required int carId, // FIXED
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    var response = await remoteDataSource.createBooking(
      userId: userId,
      carId: carId,
      totalPrice: totalPrice,
      startDate: startDate,
      endDate: endDate,
    );

    return response.fold(
      (l) {
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        return Right(BookingModel.fromJson(Map<String, dynamic>.from(r)));
      },
    );
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getBookingById(int userId) async {
    var response = await remoteDataSource.getBookingById(userId);

    return response.fold(
      (l) {
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        if (r is! List) {
          return Left(
            ServerFailure('Unexpected response format: ${r.runtimeType}'),
          );
        }

        final bookings = r.map((b) {
          return BookingModel.fromJson(Map<String, dynamic>.from(b));
        }).toList();

        return Right(bookings);
      },
    );
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getUserBookings(
    int userId,
  ) async {
    var response = await remoteDataSource.getUserBookings(userId);

    return response.fold(
      (l) {
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        if (r is! List) {
          return Left(
            ServerFailure('Unexpected response format: ${r.runtimeType}'),
          );
        }

        final bookings = r.map((b) {
          return BookingModel.fromJson(Map<String, dynamic>.from(b));
        }).toList();

        return Right(bookings);
      },
    );
  }
}
