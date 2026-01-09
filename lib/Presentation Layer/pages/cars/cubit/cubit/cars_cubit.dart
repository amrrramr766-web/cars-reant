import 'package:bloc/bloc.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_state.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository carRepository;

  CarsCubit(this.carRepository) : super(CarsInitial());

  int pageNumber = 1;
  final int pageSize = 3;
  bool hasMoreData = true;

  List<CarEntity> _allCars = [];

  // نعيد List<CarEntity> مباشرة
  Future<List<CarEntity>> fetchCars({
    bool loadMore = false,
    String? brand,
    double? minPrice,
    double? maxPrice,
    String? gear,
    String? gas,
    bool? isAvailable,
  }) async {
    if (state is CarsInitial) emit(CarLoading());

    if (!hasMoreData && loadMore) return [];

    if (loadMore) pageNumber++;

    final response = await carRepository.getCars(
      pageNumber: pageNumber,
      pageSize: pageSize,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      gear: gear,
      gas: gas,
      isAvailable: isAvailable,
    );

    return response.fold(
      (failure) {
        emit(CarError(failure.toString()));
        throw Exception(failure.toString());
      },
      (data) {
        final carsList = List<CarEntity>.from(data);
        hasMoreData = carsList.length == pageSize;

        if (!loadMore && pageNumber == 1) {
          _allCars = carsList;
        } else {
          _allCars.addAll(carsList);
        }

        emit(CarLoaded(cars: List.from(_allCars)));
        return carsList;
      },
    );
  }

  Future<List<CarEntity>> fetchCarsPage(
    int pageKey, {
    String? brand,
    double? minPrice,
    double? maxPrice,
    String? gear,
    String? gas,
    bool? isAvailable,
  }) async {
    pageNumber = pageKey;
    if (_allCars.isEmpty) emit(CarLoading());

    final response = await carRepository.getCars(
      pageNumber: pageNumber,
      pageSize: pageSize,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      gear: gear,
      gas: gas,
      isAvailable: isAvailable,
    );

    return response.fold(
      (failure) {
        emit(CarError(failure.toString()));
        throw Exception(failure.toString());
      },
      (data) {
        final carsList = List<CarEntity>.from(data);
        hasMoreData = carsList.length == pageSize;

        if (pageKey == 1) {
          _allCars = carsList;
        } else {
          _allCars.addAll(carsList);
        }

        emit(CarLoaded(cars: List.from(_allCars)));
        return carsList;
      },
    );
  }
}
