import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/data/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';

class CarRemoteDataSource {
  final Crud crud;
  final AuthLocalDataSource authLocalDataSource;

  CarRemoteDataSource(this.crud, this.authLocalDataSource);

  Future<Either<StatusRequest, dynamic>> getCars({
    required int pageNumber,
    required int pageSize,
    String? brand,
    double? minPrice,
    double? maxPrice,
    String? gear,
    String? gas,
    bool? isAvailable,
  }) async {
    final userId = authLocalDataSource.getUserID();
    if (userId == null) {
      return Left(StatusRequest.failure);
    }

    // تجهيز جسم الطلب
    final body = {
      'brand': brand ?? null,
      'minPrice': minPrice ?? null,
      'maxPrice': maxPrice ?? null,
      'gear': gear ?? null,
      'gas': gas ?? null,
      'isAvailable': isAvailable ?? null,
    };

    // تجهيز Query Parameters
    final queryParameters = {
      'userId': userId,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };

    // إرسال الطلب
    return await crud.postData(
      LinkApi.getCars(),
      body,
      queryParameters: queryParameters,
    );
  }

  Future<Either<StatusRequest, dynamic>> getCarById(int id) async {
    return await crud.getData("${LinkApi.getCarById}$id");
  }

  Future<Either<StatusRequest, dynamic>> searchCars(String query) async {
    return await crud.getData("${LinkApi.search}?q=$query");
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
