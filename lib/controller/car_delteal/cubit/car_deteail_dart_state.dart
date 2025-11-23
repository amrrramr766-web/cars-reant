part of 'car_deteail_dart_cubit.dart';

@immutable
sealed class CarDeteailDartState extends Equatable {
  const CarDeteailDartState();
  @override
  List<Object?> get props => [];
}

final class CarDeteailDartInitial extends CarDeteailDartState {}

final class CarDeteailDartLoading extends CarDeteailDartState {}

final class CarDeteailDartLoaded extends CarDeteailDartState {
  final List<ReviewModel> reviews;
  const CarDeteailDartLoaded(this.reviews);
}

final class CarDeteailDartError extends CarDeteailDartState {
  final String message;
  const CarDeteailDartError(this.message);
}
