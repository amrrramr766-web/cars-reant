import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class CarsState extends Equatable {
  const CarsState();

  @override
  List<Object?> get props => [];
}

final class CarsInitial extends CarsState {}

final class CarLoading extends CarsState {}

final class CarLoaded extends CarsState {
  final List<CarEntity> cars;
  final int pageNumber;
  final bool hasMoreData;

  const CarLoaded({
    required this.cars,
    this.pageNumber = 1,
    this.hasMoreData = true,
  });

  CarLoaded copyWith({
    List<CarEntity>? cars,
    int? pageNumber,
    bool? hasMoreData,
  }) {
    return CarLoaded(
      cars: cars ?? this.cars,
      pageNumber: pageNumber ?? this.pageNumber,
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }

  @override
  List<Object?> get props => [cars, pageNumber, hasMoreData];
}

final class CarError extends CarsState {
  final String errorMessage;

  const CarError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
