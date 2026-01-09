part of 'booking_cubit.dart';

@immutable
sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final String message;
  const BookingSuccess(this.message);
}

class BookingLoaded extends BookingState {
  final List<BookingEntity> bookings; // أو BookingDTO
  const BookingLoaded(this.bookings);
}

final class BookingFailure extends BookingState {
  final String error;
  const BookingFailure(this.error);
}
