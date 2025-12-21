import 'package:bloc/bloc.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarRepository carRepository;

  CarsCubit(this.carRepository) : super(CarsInitial());

  Future<void> fetchCars() async {
    emit(CarLoading());
    try {
      final response = await carRepository.getCars();
      response.fold(
        (failure) {
          emit(CarError(failure.toString()));
        },
        (data) {
          emit(CarLoaded(cars: data));
        },
      );
    } catch (e) {
      emit(CarError(e.toString()));
    }
  }
}
