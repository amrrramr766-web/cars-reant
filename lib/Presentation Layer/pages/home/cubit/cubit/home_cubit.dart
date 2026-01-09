import 'package:bloc/bloc.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/data/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/data/Data%20Layer/model/offer_model.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CarRepository carRepository;
  final FavoritesRepository favoritesRepository;

  static const int _pageSize = 3;

  HomeCubit(this.carRepository, this.favoritesRepository)
    : super(HomeState.initial());

  int _currentPage = 1;
  bool _isFetching = false;
  Map<int, dynamic> _favoritesCache = {};

  Future<void> fetchCars({
    bool loadMore = false,
    String? brand,
    double? minPrice,
    double? maxPrice,
    String? gear,
    String? gas,
    bool? isAvailable,
  }) async {
    if (_isFetching) return;
    _isFetching = true;

    if (!loadMore) {
      _currentPage = 1;
      emit(state.copyWith(status: HomeStatus.loading, cars: []));
    }

    final response = await carRepository.getCars(
      pageNumber: _currentPage,
      pageSize: _pageSize,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      gear: gear,
      gas: gas,
      isAvailable: isAvailable,
    );

    await response.fold(
      (failure) {
        if (failure is NetworkFailure) {
          emit(state.copyWith(status: HomeStatus.networkFailure));
        } else {
          emit(
            state.copyWith(
              status: HomeStatus.failure,
              errorMessage: failure.message,
            ),
          );
        }
      },
      (cars) async {
        // Load favorites once
        if (_favoritesCache.isEmpty) {
          final favResponse = await favoritesRepository.getFavoriteCars();
          favResponse.fold((_) {}, (favList) {
            _favoritesCache = {for (var f in favList) f.id: f};
          });
        }

        final mergedCars = cars.map((car) {
          final fav = _favoritesCache[car.id];
          return fav != null
              ? car.copyWith(imageUrl: fav.imageUrl, isFavorite: true)
              : car;
        }).toList();

        final updatedCars = loadMore
            ? [...state.cars, ...mergedCars]
            : mergedCars;

        emit(
          state.copyWith(
            status: HomeStatus.success,
            cars: updatedCars,
            brands: updatedCars
                .map((c) => c.brand)
                .whereType<String>()
                .toSet()
                .toList(),
            carsByBrand: brand == null
                ? updatedCars
                : updatedCars.where((c) => c.brand == brand).toList(),
          ),
        );

        _currentPage++;
      },
    );

    _isFetching = false;
  }

  Future<void> getOffers() async {
    final response = await carRepository.getOffers();

    response.fold((_) => emit(state.copyWith(offers: [])), (data) {
      emit(
        state.copyWith(
          offers: data.map<OfferModel>((e) => OfferModel.fromJson(e)).toList(),
        ),
      );
    });
  }
}
