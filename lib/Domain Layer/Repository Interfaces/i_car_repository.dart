// lib/domain/repositories/i_car_repository.dart
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICarRepository {
  /// Fetches all available cars
  Future<Either<Failure, List<CarModel>>> getCars();

  /// Fetches a specific car by ID
  Future<Either<Failure, CarModel>> getCarById(int id);

  /// Searches cars with filters
  Future<Either<Failure, List<SuggestionsModel>>> searchCars({String? query});

  /// Gets featured/recommended cars
  Future<Either<Failure, List<CarModel>>> getFeaturedCars();
}
