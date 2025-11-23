import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/data/model/car_model.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeData {
  final Crud crud;
  HomeData(this.crud);

  Future<Either<StatusRequest, dynamic>> getAllCars() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt("userID");
      String url = "${LinkApi.getCars}${userId ?? 0}";
      print("🌐 [HomeData] Fetching cars from URL: $url");

      final response = await crud.getData(url);

      response.fold(
        (failure) => print("❌ [HomeData] Failed to fetch cars: $failure"),
        (data) => print("✅ [HomeData] Raw response: $data"),
      );

      return response;
    } catch (e) {
      print("⚠️ [HomeData] Exception in getAllCars: $e");
      return Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> addCar(CarModel car) async {
    try {
      print("🌐 [HomeData] Adding car: ${car.brand} ${car.model}");
      final response = await crud.postData(LinkApi.addCar, {
        "brand": car.brand,
        "model": car.model,
        "year": car.year,
        "imageUrl": car.imageUrl,
        "plateNumber": car.plateNumber,
        "gear": car.gear,
        "gas": car.gas,
        "pricePerDay": car.pricePerDay,
        "seat": car.seat,
        "isAvailable": car.isAvailable,
        "isFave": car.isFave,
      });

      response.fold(
        (failure) => print("❌ [HomeData] Failed to add car: $failure"),
        (data) => print("✅ [HomeData] Car added response: $data"),
      );

      return response;
    } catch (e) {
      print("⚠️ [HomeData] Exception in addCar: $e");
      return Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> getOffers() async {
    try {
      print("🌐 [HomeData] Fetching offers from URL: ${LinkApi.getOffers}");
      final response = await crud.getData(LinkApi.getOffers);

      response.fold(
        (failure) => print("❌ [HomeData] Failed to fetch offers: $failure"),
        (data) => print("✅ [HomeData] Raw offers response: $data"),
      );

      return response;
    } catch (e) {
      print("⚠️ [HomeData] Exception in getOffers: $e");
      return Left(StatusRequest.serverfailure);
    }
  }
}
