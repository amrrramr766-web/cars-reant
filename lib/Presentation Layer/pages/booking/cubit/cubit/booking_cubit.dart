import 'package:bloc/bloc.dart';
import 'package:car_rent/Domain%20Layer/Entities/booking_entity.dart';
import 'package:car_rent/data/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/core/constant/erorr.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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
      final Either<Failure, BookingEntity> response = await bookingRepository
          .createBooking(
            userId: userId,
            carId: carId,
            totalPrice: totalPrice,
            startDate: startDate,
            endDate: endDate,
          );

      response.fold(
        (failure) {
          emit(BookingFailure(failure.message));
        },
        (booking) {
          emit(BookingSuccess("Booking successful! ID: ${booking.id}"));
        },
      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }

  Future<void> fetchUserBookings(int userId) async {
    if (userId <= 0) {
      emit(BookingLoaded([])); // Emit empty list for invalid userId
      return;
    }
    emit(BookingLoading());
    try {
      final Either<Failure, List<BookingEntity>> response =
          await bookingRepository.getUserBookings(userId);

      response.fold(
        (failure) {
          // Emit empty list instead of error
          emit(BookingLoaded([]));
        },
        (bookings) {
          emit(BookingLoaded(bookings));
        },
      );
    } catch (e) {
      // Emit empty list instead of error
      emit(BookingFailure(e.toString()));
    }
  }
}
