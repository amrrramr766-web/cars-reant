// lib/domain/repositories/i_favorites_repository.dart
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';

abstract class IFavoritesRepository {
  /// Toggles a car's favorite status
  Future<Either<Failure, void>> toggleFavorite(int userId);

  /// Gets all favorite cars for the current user
  Future<Either<Failure, List<CarEntity>>> getFavoriteCars();
}
