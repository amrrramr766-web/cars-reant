import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/booking_remote_data_source.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/booking_model.dart';
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
    String startDateStr = startDate.toIso8601String();
    String endDateStr = endDate.toIso8601String();

    print("Sending booking request:");
    print({
      "userID": userId,
      "carID": carId, // still send carID because API expects it
      "totalPrice": totalPrice,
      "status": "pending",
      "startDate": startDateStr,
      "endDate": endDateStr,
    });

    var response = await remoteDataSource.createBooking(
      userId: userId,
      carId: carId,
      totalPrice: totalPrice,
      startDate: startDate,
      endDate: endDate,
    );

    print("Raw response from server: $response");

    return response.fold(
      (l) {
        print("Error received: $l");
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        print("Processed response: $r");
        int bookingId = r['bookingID'];
        print("Booking ID received: $bookingId");
        return Right(BookingModel.fromJson(Map<String, dynamic>.from(r)));
      },
    );
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getBookingById(int userId) async {
    print("Fetching bookings for userId: $userId");

    var response = await remoteDataSource.getBookingById(userId);

    print("Raw response from server: $response");
    print("Response runtimeType: ${response.runtimeType}");

    return response.fold(
      (l) {
        print("Request failed with error: $l");
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        if (r is! List) {
          print(
            "Unexpected response type! Expected List, got ${r.runtimeType}",
          );
          return Left(
            ServerFailure('Unexpected response format: ${r.runtimeType}'),
          );
        }

        print("Server returned ${r.length} items");

        final bookings = r.map((b) {
          print("Parsing booking: $b");
          return BookingModel.fromJson(Map<String, dynamic>.from(b));
        }).toList();

        print("Parsed ${bookings.length} bookings successfully");
        return Right(bookings);
      },
    );
  }

  @override
  Future<Either<Failure, List<BookingModel>>> getUserBookings(
    int userId,
  ) async {
    print("Fetching bookings for userId: $userId");

    var response = await remoteDataSource.getUserBookings(userId);

    print("Raw response from server: $response");
    print("Response runtimeType: ${response.runtimeType}");

    return response.fold(
      (l) {
        print("Request failed with error: $l");
        return Left(
          ServerFailure('Unexpected response format: ${l.runtimeType}'),
        );
      },
      (r) {
        if (r is! List) {
          print(
            "Unexpected response type! Expected List, got ${r.runtimeType}",
          );
          return Left(
            ServerFailure('Unexpected response format: ${r.runtimeType}'),
          );
        }

        print("Server returned ${r.length} items");

        final bookings = r.map((b) {
          print("Parsing booking: $b");
          return BookingModel.fromJson(b);
        }).toList();

        print("Parsed ${bookings.length} bookings successfully");
        return Right(bookings.cast<BookingModel>());
      },
    );
  }
}
