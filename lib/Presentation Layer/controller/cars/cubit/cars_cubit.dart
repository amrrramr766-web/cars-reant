import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository carRepository;
  List<CarModel> cars = [];

  CarsCubit(this.carRepository) : super(CarsInitial());

  Future<void> fetchCars() async {
    print('🚘 [CarsCubit] fetchCars() called');
    emit(CarLoading());
    try {
      print('🌐 [CarsCubit] Fetching all cars from backend...');
      final response = await carRepository.getCars();
      response.fold(
        (failure) {
          print('❌ [CarsCubit] Failed to fetch cars: $failure');
          emit(CarError(failure.toString()));
        },
        (data) {
          print('✅ [CarsCubit] Cars received: ${(data as List).length} items');
          cars = List<CarModel>.from(
            (data).map((car) => CarModel.fromJson(car as Map<String, dynamic>)),
          );
          print('🃊 [CarsCubit] Cars mapped successfully, emitting CarLoaded');
          emit(CarLoaded(cars: cars));
        },
      );
    } catch (e) {
      print('💥 [CarsCubit] Exception in fetchCars: $e');
      emit(CarError(e.toString()));
    }
  }
}
