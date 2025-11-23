import 'package:bloc/bloc.dart';
import 'package:car_rent/data/data_source/remote/booking/booking_data.dart';
import 'package:dartz/dartz.dart';
import 'package:car_rent/core/class/states_request.dart';
import 'package:flutter/material.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingData bookingData;
  BookingCubit(this.bookingData) : super(BookingInitial());

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
    emit(BookingLoading());
    try {
      print('🌐 [BookingCubit] Sending booking request to backend...');
      final Either<StatusRequest, int> response = await bookingData.addBooking(
        userId: userId,
        carID: carId,
        totalPrice: totalPrice,
        startDate: startDate,
        endDate: endDate,
      );

      response.fold(
        (failure) {
          print('❌ [BookingCubit] Booking failed: $failure');
          emit(BookingFailure(failure.toString()));
        },
        (bookingId) {
          print('✅ [BookingCubit] Booking successful! ID: $bookingId');
          emit(BookingSuccess("Booking successful! ID: $bookingId"));
        },
      );
    } catch (e) {
      print('💥 [BookingCubit] Exception in makeBooking: $e');
      emit(BookingFailure(e.toString()));
    }
  }

  Future<void> fetchUserBookings(int userId) async {
    print('🔍 [BookingCubit] fetchUserBookings() called for userId: $userId');
    emit(BookingLoading());
    try {
      print('🌐 [BookingCubit] Fetching bookings from backend...');
      final Either<StatusRequest, List<dynamic>> response = await bookingData
          .getBookingsByUserId(userId);

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
