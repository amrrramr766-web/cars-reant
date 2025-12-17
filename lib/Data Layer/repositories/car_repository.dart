import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/car_remote_data_source.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_car_repository.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';
import 'package:car_rent/link_api.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarRepository implements ICarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, CarModel>> getCarById(int id) async {
    print('[SearchData] getCarById START id=$id -> ${LinkApi.getCarById}$id');
    final response = await remoteDataSource.getCarById(id);
    print('[SearchData] getCarById RESULT id=$id -> $response');
    return response.fold((status) => Left(_mapStatusRequestToFailure(status)), (
      data,
    ) {
      try {
        CarModel listData;
        listData = CarModel.fromJson(data);
        return Right(listData);
      } catch (e) {
        return Left(ServerFailure('Failed to parse car data: $e'));
      }
    });
  }

  Future<Either<StatusRequest, List<SuggestionsModel>>> getSuggestions() async {
    print('[SearchData] getSuggestions START -> ${LinkApi.getSuggestions}');

    final response = await remoteDataSource.getSuggestions();

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }

  Future<Either<StatusRequest, List<SuggestionsModel>>> search(
    String query,
  ) async {
    print('[SearchData] search START query="$query" -> ${LinkApi.Search}');
    final response = await remoteDataSource.searchCars(query);
    print('[SearchData] search RESULT query="$query" -> $response');
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }

  @override
  Future<Either<Failure, List<CarModel>>> getCars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userID");
    var response = await remoteDataSource.getCars(userId ?? 0);

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

        List<CarModel> cars = listData
            .map((e) => CarModel.fromJson(e))
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
        return const CacheFailure('No internet connection');
      default:
        return const ServerFailure('An unknown error occurred');
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> getFeaturedCars() {
    // TODO: implement getFeaturedCars
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<SuggestionsModel>>> searchCars({
    String? query,
  }) async {
    print('[SearchData] search START query="$query" -> ${LinkApi.Search}');
    final response = await remoteDataSource.getSuggestions();
    print('[SearchData] search RESULT query="$query" -> $response');
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
