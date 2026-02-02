import 'package:car_rent/Domain%20Layer/Entities/booking_entity.dart';
import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/booking_remote_data_source.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/booking_model.dart';
import 'package:dartz/dartz.dart';

class BookingRepository implements IBookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, BookingEntity>> createBooking({
    required int userId,
    required int carId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await remoteDataSource.createBooking(
      userId: userId,
      carId: carId,
      totalPrice: totalPrice,
      startDate: startDate,
      endDate: endDate,
    );

    return response.fold(
      (failure) => Left(
        ServerFailure("Unexpected response format: ${failure.runtimeType}"),
      ),
      (json) => Right(BookingModel.fromJson(json).toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getUserBookings(
    int userId,
  ) async {
    final response = await remoteDataSource.getBookingById(userId);

    return response.fold(
      (failure) => Left(
        ServerFailure("Unexpected response format: ${failure.runtimeType}"),
      ),
      (data) {
        // Handle if data is a List directly or inside a map
        final List<dynamic> listCallback = data is List
            ? data
            : data['data'] ?? [];
        return Right(
          listCallback.map((e) => BookingModel.fromJson(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either<Failure, void>> cancelBooking(int bookingId) {
    // TODO: implement cancelBooking
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookingById(int id) {
    // TODO: implement getBookingById
    throw UnimplementedError();
  }
}
