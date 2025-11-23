import 'package:bloc/bloc.dart';
import 'package:car_rent/data/data_source/remote/reviwe/reviwe.dart';
import 'package:car_rent/data/model/reviwe_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'car_deteail_dart_state.dart';

class CarDeteailDartCubit extends Cubit<CarDeteailDartState> {
  final ReviweData reviwe;
  CarDeteailDartCubit(this.reviwe) : super(CarDeteailDartInitial());

  List<ReviewModel> reviews = [];

  Future<void> fetchReviews(int carId) async {
    print('⭐ [CarDetailCubit] fetchReviews() called for carId: $carId');
    emit(CarDeteailDartLoading());
    try {
      print('🌐 [CarDetailCubit] Fetching reviews from backend...');
      final response = await reviwe.getData(carId);

      response.fold(
        (status) {
          print(
            '❌ [CarDetailCubit] Failed to fetch reviews: ${status.toString()}',
          );
          emit(CarDeteailDartError("حدث خطأ في الاتصال: ${status.toString()}"));
        },
        (data) {
          print(
            '✅ [CarDetailCubit] Reviews received: ${data is List ? data.length : 0} items',
          );
          List<ReviewModel> loadedReviews = [];
          if (data is List && data.isNotEmpty) {
            loadedReviews = data.map((e) {
              print('📦 [CarDetailCubit] Mapping review...');
              return ReviewModel.fromJson(e as Map<String, dynamic>);
            }).toList();
            print(
              '✅ [CarDetailCubit] ${loadedReviews.length} reviews mapped successfully',
            );
          } else {
            print('⚠️  [CarDetailCubit] No reviews data received');
          }
          emit(CarDeteailDartLoaded(loadedReviews));
        },
      );
    } catch (e) {
      print('💥 [CarDetailCubit] Exception in fetchReviews: $e');
      emit(CarDeteailDartError("حدث خطأ غير متوقع: $e"));
    }
  }
}
