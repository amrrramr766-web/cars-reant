import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/Presentation%20Layer/controller/bookin_cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Data%20Layer/model/booking_model.dart';
import 'package:car_rent/Data%20Layer/Remote%20Data%20Sources/booking_remote_data_source.dart';
import 'package:car_rent/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/Presentation%20Layer/widget/booking%20widget/history/rental_card.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// shared_preferences not needed here

class CardList extends StatefulWidget {
  final bool showPast;
  const CardList({super.key, required this.showPast});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  BookingCubit? bookingCubit;

  @override
  void initState() {
    super.initState();
    _initBookingCubit();
  }

  Future<void> _initBookingCubit() async {
    final userId = sl<AuthLocalDataSource>().getUserID()!;

    setState(() {
      bookingCubit = BookingCubit(
        BookingRepository(sl<BookingRemoteDataSource>()),
      )..fetchUserBookings(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (bookingCubit == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocProvider.value(
      value: bookingCubit!,
      child: Scaffold(
        body: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookingLoaded) {
              final now = DateTime.now();

              // ✅ Filter bookings based on showPast flag
              final filteredBookings = widget.showPast
                  ? state.bookings.where((b) {
                      final end = b.endDate != null
                          ? DateTime.parse(b.endDate!)
                          : now;
                      return end.isBefore(now);
                    }).toList()
                  : state.bookings.where((b) {
                      final end = b.endDate != null
                          ? DateTime.parse(b.endDate!)
                          : now;
                      return end.isAfter(now) || end.isAtSameMomentAs(now);
                    }).toList();

              // ✅ Show message if empty
              if (filteredBookings.isEmpty) {
                return Center(
                  child: Text(
                    widget.showPast
                        ? "No past bookings."
                        : "No current bookings.",
                  ),
                );
              }

              // ✅ Use filteredBookings in ListView
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: filteredBookings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final booking = filteredBookings[index];
                  final status = booking.status; // BookingStatus?
                  final statusText = status != null
                      ? status.toString().split('.').last.toUpperCase()
                      : 'UNKNOWN';

                  return RentalCard(
                    status: statusText,
                    title: "${booking.brand ?? "Car"} ${booking.model ?? ""}"
                        .trim(),
                    startDate: booking.startDate != null
                        ? DateTime.parse(booking.startDate!)
                        : null,
                    endDate: booking.endDate != null
                        ? DateTime.parse(booking.endDate!)
                        : null,
                    statusColor: booking.status == BookingStatus.confirmed
                        ? Colors.green
                        : Colors.grey,
                    buttonText: booking.status == BookingStatus.confirmed
                        ? "Manage Rental"
                        : "View Details",
                    buttonColor: booking.status == BookingStatus.confirmed
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.2),
                    textColor: booking.status == BookingStatus.confirmed
                        ? Colors.white
                        : Colors.blue,
                  );
                },
              );
            } else if (state is BookingFailure) {
              return Center(child: Text(state.error));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    bookingCubit?.close();
    super.dispose();
  }
}
