// lib/domain/repositories/i_search_repository.dart
import 'package:car_rent/core/constant/erorr.dart';
import 'package:car_rent/data/Data%20Layer/model/suggestions_model.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<Failure, List<SuggestionsModel>>> searchCars({
    String? brand,
    double? maxPrice,
    String? category,
    double? minPrice,
  });
}
