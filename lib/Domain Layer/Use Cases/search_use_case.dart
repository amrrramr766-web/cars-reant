import 'package:car_rent/Domain Layer/Repository Interfaces/i_searh_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase {
  final ISearchRepository repository;

  SearchUseCase(this.repository);

  Future<Object> searchCars({
    String? brand,
    double? maxPrice,
    String? category,
    double? minPrice,
  }) async {
    // Business logic validation
    if (brand == null &&
        maxPrice == null &&
        category == null &&
        minPrice == null) {
      return Left(ValidationFailure('At least one filter is required'));
    }

    // Delegate to repository
    return await repository.searchCars(
      brand: brand,
      maxPrice: maxPrice,
      category: category,
      minPrice: minPrice,
    );
  }
}
