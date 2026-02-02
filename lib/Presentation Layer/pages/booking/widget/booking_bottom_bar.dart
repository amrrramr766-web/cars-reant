import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/confirm_booking_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingBottomBar extends StatelessWidget {
  final int totalDays;
  final int carId;
  final int userId;
  final DateTime? startDate;
  final DateTime? endDate;
  final double totalPrice;

  const BookingBottomBar({
    Key? key,
    required this.totalDays,
    required this.carId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteWithOpacity(0.9),
        border: Border(top: BorderSide(color: AppColors.greyShades[300]!)),
      ),
      child: ConfirmBookingButton(
        totalDays: totalDays,
        carId: carId,
        userId: userId,
        startDate: startDate ?? DateTime.now(),
        endDate: endDate ?? DateTime.now(),
        totalPrice: totalPrice,
      ),
    );
  }
}
