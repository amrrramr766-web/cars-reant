import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/car_remote_data_source.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/extension/car_model_mapper.dart';
import 'package:car_rent/Data%20Layer/model/suggestions_model.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Domain%20Layer/Repository%20Interfaces/i_car_repository.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';

class CarRepository implements ICarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepository(this.remoteDataSource);

  // --- إصلاح دالة getSuggestions ---
  @override // أضفنا الـ Override ليتطابق مع الواجهة
  Future<Either<Failure, List<SuggestionsModel>>> getSuggestions() async {
    final response = await remoteDataSource.getSuggestions();
    // تحويل StatusRequest إلى Failure باستخدام الدالة المساعدة
    return response.fold(
      (status) => Left(_mapStatusRequestToFailure(status)),
      (data) => Right(data),
    );
  }

  // --- إصلاح دالة search ---
  @override
  Future<Either<Failure, List<SuggestionsModel>>> searchCars(
    String? query,
  ) async {
    final response = await remoteDataSource.searchCars(query!);

    return response.fold(
      (status) => Left(_mapStatusRequestToFailure(status)),
      (data) => Right(data),
    );
  }

  // --- تحديث بقية الدوال المتبقية لتعيد Failure بدل StatusRequest ---

  Future<Either<Failure, dynamic>> getReview(int carId) async {
    final response = await remoteDataSource.getReview(carId);
    return response.fold(
      (status) => Left(_mapStatusRequestToFailure(status)),
      (data) => Right(data),
    );
  }

  Future<Either<Failure, dynamic>> getOffers() async {
    final response = await remoteDataSource.getOffers();
    return response.fold(
      (status) => Left(_mapStatusRequestToFailure(status)),
      (data) => Right(data),
    );
  }

  // ... (بقية الدوال getCarById و getCars تبقى كما هي لأنك استخدمت فيها Fold بالفعل)

  // الدالة المساعدة التي تضمن توحيد الأخطاء
  Failure _mapStatusRequestToFailure(StatusRequest status) {
    switch (status) {
      case StatusRequest.serverfailure:
        return const ServerFailure('Server error occurred');
      case StatusRequest.offlinefailure:
        return const NetworkFailure('No internet connection');
      default:
        return const ServerFailure('An unknown error occurred');
    }
  }

  @override
  Future<Either<Failure, CarEntity>> getCarById(int id) {
    // TODO: implement getCarById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getCars({
    required int pageNumber,
    required int pageSize,
    String? brand,
    double? minPrice,
    double? maxPrice,
    String? gear,
    String? gas,
    bool? isAvailable,
  }) async {
    // 1. استدعاء البيانات من الـ Remote Data Source
    final response = await remoteDataSource.getCars(
      pageNumber: pageNumber,
      pageSize: pageSize,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      gear: gear,
      gas: gas,
      isAvailable: isAvailable,
    );

    // 2. معالجة النتيجة وتحويلها من Model إلى Entity
    return response.fold((status) => Left(_mapStatusRequestToFailure(status)), (
      data,
    ) {
      try {
        final cars = data.map((carModel) => carModel.toEntity()).toList();
        return Right(cars);
      } catch (e) {
        return Left(ServerFailure('Parsing Error: $e'));
      }
    });
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getFeaturedCars() {
    // TODO: implement getFeaturedCars
    throw UnimplementedError();
  }
}
