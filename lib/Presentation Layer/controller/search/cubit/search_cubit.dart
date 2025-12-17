import 'package:bloc/bloc.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_state.dart';
import 'package:car_rent/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';

class SearchCubit extends Cubit<SearchState> {
  final CarRepository searchRepository;
  SearchCubit(this.searchRepository) : super(SearchInitial());

  Future<void> fetchSearchResults(String query) async {
    print('🔍 [SearchCubit] fetchSearchResults() called with query: $query');
    emit(SearchResultsLoading());
    try {
      print('🌐 [SearchCubit] Fetching search results from backend...');
      final response = await searchRepository.search(query);
      response.fold(
        (failure) {
          print('❌ [SearchCubit] Failed to fetch search results: $failure');
          emit(SearchError("حدث خطأ في الاتصال: ${failure.toString()}"));
        },
        (data) {
          print(
            '✅ [SearchCubit] Search results received: ${data.length} items',
          );
          List<SuggestionsModel> searchResults = [];
          if (data.isNotEmpty) {
            searchResults = data.map((e) {
              print('📦 [SearchCubit] Mapping search result...');
              return SuggestionsModel.fromJson(e as Map<String, dynamic>);
            }).toList();
            print(
              '✅ [SearchCubit] ${searchResults.length} search results mapped successfully',
            );
          } else {
            print('⚠️  [SearchCubit] No search results data received');
          }
          emit(SearchLoaded(searchResults: searchResults));
        },
      );
    } catch (e) {
      print('💥 [SearchCubit] Exception in fetchSearchResults: $e');
      emit(SearchError("حدث خطأ غير متوقع: $e"));
    }
  }

  Future<void> fetchSuggestions() async {
    print('💡 [SearchCubit] fetchSuggestions() called');
    emit(SearchSuggestionsLoading()); // حالة تحميل جديدة
    try {
      final response = await searchRepository.getSuggestions();
      response.fold(
        (failure) =>
            emit(SearchError("حدث خطأ في الاتصال: ${failure.toString()}")),
        (data) {
          final suggestions = (data as List<dynamic>)
              .map((e) => SuggestionsModel.fromJson(e as Map<String, dynamic>))
              .toList();
          emit(
            SearchSuggestionsLoaded(suggestions: suggestions),
          ); // حالة جديدة للاقتراحات
        },
      );
    } catch (e) {
      emit(SearchError("حدث خطأ غير متوقع: $e"));
    }
  }

  Future<CarModel?> getCarDetails(int carId) async {
    try {
      final result = await searchRepository.getCarById(carId);

      return result.fold(
        (failure) {
          // فشل
          return null;
        },
        (data) {
          // نجاح → رجّع CarModel
          return CarModel.fromJson(data as Map<String, dynamic>);
        },
      );
    } catch (e) {
      // أي خطأ غير متوقع → رجّع null
      return null;
    }
  }
}
