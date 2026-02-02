import 'package:bloc/bloc.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/data/Data%20Layer/model/reviwe_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'car_deteail_dart_state.dart';

class CarDeteailDartCubit extends Cubit<CarDeteailDartState> {
  final CarRepository carRepository;
  CarDeteailDartCubit(this.carRepository) : super(CarDeteailDartInitial());

  List<ReviewModel> reviews = [];

  Future<void> fetchReviews(int carId) async {
    emit(CarDeteailDartLoading());
    try {
      final response = await carRepository.getReview(carId);

      response.fold(
        (status) {
          emit(CarDeteailDartError("حدث خطأ في الاتصال: ${status.toString()}"));
        },
        (data) {
          List<ReviewModel> loadedReviews = [];
          if (data is List && data.isNotEmpty) {
            loadedReviews = data.map((e) {
              return ReviewModel.fromJson(e as Map<String, dynamic>);
            }).toList();
          } else {}
          emit(CarDeteailDartLoaded(loadedReviews));
        },
      );
    } catch (e) {
      emit(CarDeteailDartError("حدث خطأ غير متوقع: $e"));
    }
  }
}
