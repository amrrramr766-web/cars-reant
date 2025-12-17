import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/model/booking_model.dart';
import 'package:car_rent/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepository bookingRepository;
  BookingCubit(this.bookingRepository) : super(BookingInitial());

  Future<void> makeBooking({
    required int carId,
    required int userId,
    required double totalPrice,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    print('💫 [BookingCubit] makeBooking() called');
    print('   📊 Params: carId=$carId, userId=$userId, totalPrice=$totalPrice');
    print('   📅 Dates: $startDate to $endDate');

    if (startDate.isAfter(endDate)) {
      emit(BookingFailure("Start date cannot be after end date."));
      return;
    }
    if (totalPrice <= 0) {
      emit(BookingFailure("Total price must be positive."));
      return;
    }

    emit(BookingLoading());
    try {
      print('🌐 [BookingCubit] Sending booking request to backend...');
      final Either<Failure, BookingModel> response = await bookingRepository
          .createBooking(
            userId: userId,
            carId: carId,
            totalPrice: totalPrice,
            startDate: startDate,
            endDate: endDate,
          );

      response.fold(
        (failure) {
          print('❌ [BookingCubit] Booking failed: ${failure.message}');
          emit(BookingFailure(failure.message));
        },
        (booking) {
          print('✅ [BookingCubit] Booking successful! ID: ${booking.id}');
          emit(BookingSuccess("Booking successful! ID: ${booking.id}"));
        },
      );
    } catch (e) {
      print('💥 [BookingCubit] Exception in makeBooking: $e');
      emit(BookingFailure(e.toString()));
    }
  }

  Future<void> fetchUserBookings(int userId) async {
    if (userId <= 0) {
      print('⚠️  [BookingCubit] Invalid userId: $userId');
      emit(BookingLoaded([])); // Emit empty list for invalid userId
      return;
    }
    print('🔍 [BookingCubit] fetchUserBookings() called for userId: $userId');
    emit(BookingLoading());
    try {
      print('🌐 [BookingCubit] Fetching bookings from backend...');
      final Either<Failure, List<BookingModel>> response =
          await bookingRepository.getUserBookings(userId);

      response.fold(
        (failure) {
          print('❌ [BookingCubit] Failed to fetch bookings: $failure');
          print('⚠️  [BookingCubit] Using empty bookings list (fallback)');
          // Emit empty list instead of error
          emit(BookingLoaded([]));
        },
        (bookings) {
          print('✅ [BookingCubit] Bookings received: ${bookings.length} items');
          emit(BookingLoaded(bookings));
        },
      );
    } catch (e) {
      print('💥 [BookingCubit] Exception in fetchUserBookings: $e');
      print('⚠️  [BookingCubit] Using empty bookings list (fallback)');
      // Emit empty list instead of error
      emit(BookingLoaded([]));
    }
  }
}
