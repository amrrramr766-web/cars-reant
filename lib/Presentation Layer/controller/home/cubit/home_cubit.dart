import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/offer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CarRepository carRepository;
  HomeCubit(this.carRepository) : super(HomeInitial());

  List<CarModel> cars = [];
  List<String> brands = [];
  List<String> categories = [];
  List<CarModel> carsByBrand = [];
  List<OfferModel> offers = [];

  Future<void> fetchCars() async {
    print('🚗 [HomeCubit] fetchCars() called');
    emit(HomeLoading());
    try {
      print('🌐 [HomeCubit] Fetching cars from backend...');
      final response = await carRepository.getCars();

      response.fold(
        (failure) {
          print('❌ [HomeCubit] Failed to fetch cars: $failure');
          emit(HomeError(failure.toString()));
        },
        (data) {
          print('✅ [HomeCubit] Cars received: ${(data as List).length} items');
          cars = List<CarModel>.from(data);
          print('📊 [HomeCubit] Cars mapped successfully');

          carsByBrand = cars.where((car) => car.brand == 'Toyota').toList();
          print('🏷️  [HomeCubit] Toyota cars filtered: ${carsByBrand.length}');

          brands = cars
              .map((car) => car.brand)
              .whereType<String>()
              .toSet()
              .toList();
          print('🏢 [HomeCubit] Unique brands: $brands');

          emit(
            HomeLoaded(
              cars: cars,
              carsByBrand: carsByBrand,
              brands: brands,
              categories: categories,
              offers: offers,
            ),
          );
          print('✅ [HomeCubit] HomeLoaded state emitted');
        },
      );
    } catch (e) {
      print('💥 [HomeCubit] Exception in fetchCars: $e');
      emit(HomeError(e.toString()));
    }
  }

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    await fetchCars();
    await getOffers();
  }

  Future<void> getOffers() async {
    print('🎁 [HomeCubit] getOffers() called');
    try {
      print('🌐 [HomeCubit] Fetching offers from backend...');
      final response = await carRepository.getOffers();

      response.fold(
        (failure) {
          print('❌ [HomeCubit] Failed to fetch offers: $failure');
          print('⚠️  [HomeCubit] Using empty offers list (fallback)');
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
          print(
            '✅ [HomeCubit] Offers received: ${(data as List).length} items',
          );
          offers = List<OfferModel>.from(
            (data).map((offer) {
              print('📦 [HomeCubit] Mapping offer: ${offer["title"] ?? "N/A"}');
              return OfferModel.fromJson(offer);
            }),
          );

          print('✅ [HomeCubit] Offers list ready: ${offers.length} offers');

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
      print('💥 [HomeCubit] Exception in getOffers: $e');
      print('⚠️  [HomeCubit] Using empty offers list (fallback)');
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
