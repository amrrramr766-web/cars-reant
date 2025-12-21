// lib/domain/repositories/i_car_repository.dart
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/suggestions_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICarRepository {
  /// Fetches all available cars
  Future<Either<Failure, List<CarEntity>>> getCars();

  /// Fetches a specific car by ID
  Future<Either<Failure, CarEntity>> getCarById(int id);

  /// Searches cars with filters
  Future<Either<Failure, List<SuggestionsModel>>> searchCars({String? query});

  /// Gets featured/recommended cars
  Future<Either<Failure, List<CarEntity>>> getFeaturedCars();
}
