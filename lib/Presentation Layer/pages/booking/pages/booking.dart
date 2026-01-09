import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/booking_bottom_bar.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/booking_review_appbar.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/booking_review_body.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingReviewPage extends StatefulWidget {
  final CarEntity car;
  const BookingReviewPage({super.key, required this.car});

  @override
  State<BookingReviewPage> createState() => _BookingReviewPageState();
}

class _BookingReviewPageState extends State<BookingReviewPage> {
  DateTime? startDate;
  DateTime? endDate;
  int totalDays = 0;
  int userId = 0;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt("userID") ?? 0;
    });
  }

  void _recalculateDays() {
    if (startDate != null && endDate != null) {
      totalDays = endDate!.difference(startDate!).inDays + 1;
      setState(() {});
    }
  }

  double get grandTotal {
    const taxes = 35.20;
    const cdw = 40.0;
    const gps = 15.0;
    return (totalDays * widget.car.pricePerDay) + taxes + cdw + gps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: const BookingReviewAppBar(),
      body: BookingReviewBody(
        car: widget.car,
        startDate: startDate,
        endDate: endDate,
        totalDays: totalDays,
        onPickStart: (date) {
          startDate = date;
          _recalculateDays();
        },
        onPickEnd: (date) {
          endDate = date;
          _recalculateDays();
        },
      ),
      bottomNavigationBar: BookingBottomBar(
        totalDays: totalDays,
        carId: widget.car.id,
        userId: userId,
        startDate: startDate,
        endDate: endDate,
        totalPrice: grandTotal,
      ),
    );
  }
}
