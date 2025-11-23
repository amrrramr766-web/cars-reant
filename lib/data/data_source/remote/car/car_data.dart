import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/data/model/car_model.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CarData {
  Crud crud;
  CarData(this.crud);
  Future<Either<StatusRequest, dynamic>> getAllCars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userID");
    return await crud.getData("${LinkApi.getCars}${userId ?? 0}");
  }

  Future<Either<StatusRequest, dynamic>> addCar(CarModel car) async {
    return await crud.postData(LinkApi.addCar, {
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
  }
}
