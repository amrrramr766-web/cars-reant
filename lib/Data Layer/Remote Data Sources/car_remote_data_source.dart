import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/core/network/link_api.dart';
import 'package:dartz/dartz.dart';

class CarRemoteDataSource {
  final Crud crud;
  final AuthLocalDataSource authLocalDataSource;

  CarRemoteDataSource(this.crud, this.authLocalDataSource);

  Either<StatusRequest, List<T>> _handleListResponse<T>(
    Either<StatusRequest, dynamic> response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return response.fold((status) => Left(status), (data) {
      try {
        List listData = (data is Map && data.containsKey('data'))
            ? data['data']
            : data;
        return Right(
          listData.map((e) => fromJson(Map<String, dynamic>.from(e))).toList(),
        );
      } catch (e) {
        return Left(StatusRequest.serverfailure);
      }
    });
  }

  Future<Either<StatusRequest, List<CarModel>>> getCars({
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

    // Request body setup
    final body = {
      'brand': brand,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'gear': gear,
      'gas': gas,
      'isAvailable': isAvailable,
    };

    // Query parameters setup
    final queryParameters = {
      'userId': userId,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };

    final response = await crud.postData(
      LinkApi.getCars(),
      body,
      queryParameters: queryParameters,
    );

    return _handleListResponse(response, (json) => CarModel.fromJson(json));
  }

  Future<Either<StatusRequest, List<SuggestionsModel>>> getSuggestions() async {
    final response = await crud.getData(LinkApi.getSuggestions);
    return _handleListResponse(
      response,
      (json) => SuggestionsModel.fromJson(json),
    );
  }

  Future<Either<StatusRequest, dynamic>> getCarById(int id) async {
    return await crud.getData("${LinkApi.getCarById}$id");
  }

  Future<Either<StatusRequest, List<SuggestionsModel>>> searchCars(
    String query,
  ) async {
    final response = await crud.getData("${LinkApi.search}?q=$query");
    return _handleListResponse(
      response,
      (json) => SuggestionsModel.fromJson(json),
    );
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
