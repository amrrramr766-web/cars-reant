import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/data/model/booking_history_model.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class BookingData {
  final Crud crud;
  BookingData(this.crud);

  /// أضف حجز جديد
  Future<Either<StatusRequest, int>> addBooking({
    required int userId,
    required int carID,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    String startDateStr = startDate.toIso8601String();
    String endDateStr = endDate.toIso8601String();

    // Print the request payload
    print("Sending booking request:");
    print({
      "userID": userId,
      "carID": carID,
      "totalPrice": totalPrice,
      "status": "pending",
      "startDate": startDateStr,
      "endDate": endDateStr,
    });

    var response = await crud.postData(LinkApi.addBooking, {
      "userID": userId,
      "carID": carID,
      "totalPrice": totalPrice,
      "status": "pending", // string, not 0
      "startDate": startDateStr,
      "endDate": endDateStr,
    });

    // Print raw response for debugging
    print("Raw response from server: $response");

    return response.fold(
      (l) {
        print("Error received: $l"); // Debug error
        return Left(l);
      },
      (r) {
        print("Processed response: $r"); // Debug processed response
        int bookingId = r['bookingID'];
        print("Booking ID received: $bookingId"); // Debug booking ID
        return Right(bookingId);
      },
    );
  }

  Future<Either<StatusRequest, List<dynamic>>> getBookingsByUserId(
    int userId,
  ) async {
    print("Fetching bookings for userId: $userId");

    var response = await crud.getData("${LinkApi.getBookingsByUser}/$userId");

    print("Raw response from server: $response");
    print("Response runtimeType: ${response.runtimeType}");

    return response.fold(
      (l) {
        print("Request failed with error: $l");
        return Left(l);
      },
      (r) {
        if (r is! List) {
          print(
            "Unexpected response type! Expected List, got ${r.runtimeType}",
          );
          return Left(StatusRequest.failure);
        }

        print("Server returned ${r.length} items");

        final bookings = r.map((b) {
          print("Parsing booking: $b");
          return BookingHistoryModel.fromJson(b);
        }).toList();

        print("Parsed ${bookings.length} bookings successfully");
        return Right(bookings);
      },
    );
  }
}
