import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_favorites_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';

class FaveUseCase {
  final IFavoritesRepository repository;

  FaveUseCase(this.repository);

  Future<Either<Failure, void>> call(int carId) async {
    // Business logic validation

    // Delegate to repository
    return await repository.toggleFavorite(carId);
  }
}
