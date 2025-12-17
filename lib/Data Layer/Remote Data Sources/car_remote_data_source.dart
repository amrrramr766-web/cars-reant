import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class CarRemoteDataSource {
  final Crud crud;

  CarRemoteDataSource(this.crud);

  Future<Either<StatusRequest, dynamic>> getCars(int userId) async {
    return await crud.getData("${LinkApi.getCars}$userId");
  }

  Future<Either<StatusRequest, dynamic>> getCarById(int id) async {
    return await crud.getData("${LinkApi.getCarById}$id");
  }

  Future<Either<StatusRequest, dynamic>> searchCars(String query) async {
    return await crud.getData("${LinkApi.Search}?q=$query");
  }

  Future<Either<StatusRequest, dynamic>> getSuggestions() async {
    return await crud.getData(LinkApi.getSuggestions);
  }

  Future<Either<StatusRequest, dynamic>> getFeaturedCars() async {
    return await crud.getData(LinkApi.getOffers);
  }

  Future<Either<StatusRequest, dynamic>> getReview(int carId) async {
    return await crud.getData("${LinkApi.getReviweByCarId}$carId");
  }

  Future<Either<StatusRequest, dynamic>> getOffers() async {
    return await crud.getData(LinkApi.getOffers);
  }
}
