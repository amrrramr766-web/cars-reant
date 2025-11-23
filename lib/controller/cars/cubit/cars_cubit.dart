import 'package:bloc/bloc.dart';
import 'package:car_rent/data/data_source/remote/car/car_data.dart';
import 'package:car_rent/data/model/car_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cars_state.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarData carData;
  List<CarModel> cars = [];

  CarsCubit(this.carData) : super(CarsInitial());

  Future<void> fetchCars() async {
    print('🚘 [CarsCubit] fetchCars() called');
    emit(CarLoading());
    try {
      print('🌐 [CarsCubit] Fetching all cars from backend...');
      final response = await carData.getAllCars();
      response.fold(
        (failure) {
          print('❌ [CarsCubit] Failed to fetch cars: $failure');
          emit(CarError(failure.toString()));
        },
        (data) {
          print('✅ [CarsCubit] Cars received: ${(data as List).length} items');
          cars = List<CarModel>.from(
            (data).map((car) => CarModel.fromJson(car)),
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
