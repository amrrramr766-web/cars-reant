import 'package:car_rent/data/Data%20Layer/Remote%20Data%20Sources/car_remote_data_source.dart';
import 'package:car_rent/data/Data%20Layer/model/extension/car_model_mapper.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_car_repository.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/car_model.dart';
import 'package:car_rent/data/Data%20Layer/model/suggestions_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarRepository implements ICarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, CarEntity>> getCarById(int id) async {
    final response = await remoteDataSource.getCarById(id);
    return response.fold((status) => Left(_mapStatusRequestToFailure(status)), (
      data,
    ) {
      try {
        final carModel = CarModel.fromJson(data);
        final carEntity = carModel.toEntity();
        return Right(carEntity);
      } catch (e) {
        return Left(ServerFailure('Failed to parse car data: $e'));
      }
    });
  }

  Future<Either<StatusRequest, List<SuggestionsModel>>> getSuggestions() async {
    final response = await remoteDataSource.getSuggestions();

    return response.fold(
      (l) => Left(l), // Forward the error if Left
      (r) {
        try {
          List<dynamic> listData;

          if (r is List) {
            // If API directly returns a list
            listData = r;
          } else if (r is Map && r.containsKey('data')) {
            // If API returns a map with 'data' key
            listData = r['data'];
          } else {
            // Unexpected format
            return Left(StatusRequest.serverfailure);
          }

          // Map each item to SuggestionsModel
          final items = listData
              .map(
                (e) => SuggestionsModel.fromJson(Map<String, dynamic>.from(e)),
              )
              .toList();

          return Right(items);
        } catch (_) {
          // Catch any parsing exceptions
          return Left(StatusRequest.serverfailure);
        }
      },
    );
  }

  Future<Either<StatusRequest, List<SuggestionsModel>>> search(
    String query,
  ) async {
    final response = await remoteDataSource.searchCars(query);
    return response.fold((l) => Left(l), (r) {
      try {
        List<dynamic> listData;
        if (r is List) {
          listData = r;
        } else if (r is Map && r.containsKey('data')) {
          listData = r['data'];
        } else {
          return Left(StatusRequest.serverfailure);
        }

        final items = listData
            .map((e) => SuggestionsModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        return Right(items);
      } catch (_) {
        return Left(StatusRequest.serverfailure);
      }
    });
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getCars({
    required int pageNumber,
    required int pageSize,
    String? brand,
    double? minPrice,
    double? maxPrice,
    String? gear,
    String? gas,
    bool? isAvailable,
  }) async {
    final response = await remoteDataSource.getCars(
      pageNumber: pageNumber,
      pageSize: pageSize,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      gear: gear,
      gas: gas,
      isAvailable: isAvailable,
    );

    return response.fold((status) => Left(_mapStatusRequestToFailure(status)), (
      data,
    ) {
      try {
        List<dynamic> listData;
        if (data is List) {
          listData = data;
        } else if (data is Map<String, dynamic> && data.containsKey('data')) {
          listData = data['data'];
        } else {
          return Left(
            ServerFailure('Unexpected response format: ${data.runtimeType}'),
          );
        }

        final cars = listData
            .map((e) => CarModel.fromJson(e as Map<String, dynamic>).toEntity())
            .toList();

        return Right(cars);
      } catch (e) {
        return Left(ServerFailure('Failed to parse car data: $e'));
      }
    });
  }

  Failure _mapStatusRequestToFailure(StatusRequest status) {
    switch (status) {
      case StatusRequest.serverfailure:
        return const ServerFailure('Server error occurred');
      case StatusRequest.offlinefailure:
        return const NetworkFailure('No internet connection');
      default:
        return const ServerFailure('An unknown error occurred');
    }
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getFeaturedCars() {
    // TODO: implement getFeaturedCars
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<SuggestionsModel>>> searchCars({
    String? query,
  }) async {
    final response = await remoteDataSource.getSuggestions();
    return response.fold((status) => Left(_mapStatusRequestToFailure(status)), (
      data,
    ) {
      try {
        List<dynamic> listData;
        if (data is List) {
          listData = data;
        } else if (data is Map && data.containsKey('data')) {
          listData = data['data'];
        } else {
          // If response is not a list or doesn't have 'data', it might be a failure or unexpected format.
          return Left(
            ServerFailure('Unexpected response format: ${data.runtimeType}'),
          );
        }

        List<SuggestionsModel> cars = listData
            .map((e) => SuggestionsModel.fromJson(e))
            .toList();
        return Right(cars);
      } catch (e) {
        return Left(ServerFailure('Failed to parse car data: $e'));
      }
    });
  }

  Future<Either<StatusRequest, dynamic>> getReview(int carId) async {
    return await remoteDataSource.getReview(carId);
  }

  Future<Either<StatusRequest, dynamic>> getOffers() async {
    return await remoteDataSource.getOffers();
  }
}
