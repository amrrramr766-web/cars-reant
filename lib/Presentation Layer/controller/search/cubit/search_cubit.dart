import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_car_repository.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_state.dart';
import 'package:car_rent/Data%20Layer/repositories/car_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final ICarRepository searchRepository;

  SearchCubit(this.searchRepository) : super(SearchInitial());

  bool _suggestionsLoaded = false;
  Timer? _debounce;

  Future<void> fetchSearchResults(String query) async {
    if (query.isEmpty) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      emit(SearchResultsLoading());

      try {
        final response = await searchRepository.searchCars(query);
        response.fold(
          (failure) =>
              emit(SearchError("حدث خطأ في الاتصال: ${failure.toString()}")),
          (results) => emit(SearchLoaded(searchResults: results)), // typed list
        );
      } catch (e) {
        emit(SearchError("حدث خطأ غير متوقع: $e"));
      }
    });
  }

  Future<void> fetchSuggestions({bool forceRefresh = false}) async {
    if (_suggestionsLoaded && !forceRefresh) return;

    _suggestionsLoaded = true;
    emit(SearchSuggestionsLoading());

    try {
      final response = await searchRepository.getSuggestions();
      response.fold(
        (failure) =>
            emit(SearchError("حدث خطأ في الاتصال: ${failure.toString()}")),
        (suggestions) =>
            emit(SearchSuggestionsLoaded(suggestions: suggestions)), // typed
      );
    } catch (e) {
      emit(SearchError("حدث خطأ غير متوقع: $e"));
    }
  }

  Future<CarEntity?> getCarDetails(int carId) async {
    try {
      final result = await searchRepository.getCarById(carId);
      return result.fold(
        (failure) => null,
        (car) => car,
      ); // assume repository returns CarModel
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
