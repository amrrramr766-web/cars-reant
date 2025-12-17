// lib/domain/repositories/i_favorites_repository.dart
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:dartz/dartz.dart';

abstract class IFavoritesRepository {
  /// Toggles a car's favorite status
  Future<Either<Failure, void>> toggleFavorite(int carId, int userId);

  /// Gets all favorite cars for the current user
  Future<Either<Failure, List<CarModel>>> getFavoriteCars(int userId);
}
