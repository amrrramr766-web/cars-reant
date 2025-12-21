import 'package:bloc/bloc.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/data/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/data/Data%20Layer/model/offer_model.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CarRepository carRepository;
  final FavoritesRepository favoritesRepository;

  HomeCubit(this.carRepository, this.favoritesRepository)
    : super(HomeInitial());

  List<CarEntity> cars = [];
  List<String> brands = [];
  List<String> categories = [];
  List<CarEntity> carsByBrand = [];
  List<OfferModel> offers = [];

  Future<void> fetchCars() async {
    emit(HomeLoading());
    try {
      final response = await carRepository.getCars();

      bool success = false;
      response.fold(
        (failure) {
          emit(HomeError(failure.toString()));
        },
        (data) {
          cars = List<CarEntity>.from(data);
          success = true;
        },
      );

      if (success) {
        // Merge favorites into the cars list so UI shows favorite image/isFave
        try {
          final favResponse = await favoritesRepository.getFavoriteCars();
          favResponse.fold((failure) {}, (favList) {
            final favMap = {for (var f in favList) f.id: f};
            cars = cars.map((car) {
              final fav = favMap[car.id];
              if (fav != null) {
                return car.copyWith(imageUrl: fav.imageUrl, isFavorite: true);
              }
              return car;
            }).toList();
          });
        } catch (e) {
          emit(HomeError('Failed to load favorites: $e'));
        }

        carsByBrand = cars.where((car) => car.brand == 'Toyota').toList();

        brands = cars
            .map((car) => car.brand)
            .whereType<String>()
            .toSet()
            .toList();

        emit(
          HomeLoaded(
            cars: cars,
            carsByBrand: carsByBrand,
            brands: brands,
            categories: categories,
            offers: offers,
          ),
        );
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    await fetchCars();
    await getOffers();
  }

  Future<void> getOffers() async {
    try {
      final response = await carRepository.getOffers();

      response.fold(
        (failure) {
          // Don't emit error, just use empty list
          emit(
            HomeLoaded(
              cars: cars,
              carsByBrand: carsByBrand,
              brands: brands,
              categories: categories,
              offers: [], // Empty list as fallback
            ),
          );
        },
        (data) {
          offers = List<OfferModel>.from(
            (data).map((offer) {
              return OfferModel.fromJson(offer);
            }),
          );

          emit(
            HomeLoaded(
              cars: cars,
              carsByBrand: carsByBrand,
              brands: brands,
              categories: categories,
              offers: offers,
            ),
          );
        },
      );
    } catch (e) {
      // Don't crash, just emit with empty offers
      emit(
        HomeLoaded(
          cars: cars,
          carsByBrand: carsByBrand,
          brands: brands,
          categories: categories,
          offers: [],
        ),
      );
    }
  }
}
