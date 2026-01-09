import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class BookingRemoteDataSource {
  final Crud crud;

  BookingRemoteDataSource(this.crud);

  Future<Either<StatusRequest, dynamic>> createBooking({
    required int userId,
    required int carId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return await crud.postData(LinkApi.addBooking, {
      "userID": userId,
      "carID": carId,
      "totalPrice": totalPrice,
      "status": "pending",
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
    });
  }

  Future<Either<StatusRequest, dynamic>> getBookingById(int userId) async {
    return await crud.getData("${LinkApi.getBookingsByUser}/$userId");
  }
}
