import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/car_details_card.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/booking_details_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/price_summary_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/rental_terms_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingReviewBody extends StatelessWidget {
  final CarEntity car;
  final DateTime? startDate;
  final DateTime? endDate;
  final int totalDays;
  final Function(DateTime) onPickStart;
  final Function(DateTime) onPickEnd;

  const BookingReviewBody({
    Key? key,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.onPickStart,
    required this.onPickEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarDetailsCard(car: car),
          SizedBox(height: 20.h),
          BookingDetailsSection(
            startDate: startDate,
            endDate: endDate,
            onPickStart: onPickStart,
            onPickEnd: onPickEnd,
          ),
          SizedBox(height: 20.h),
          PriceSummarySection(
            totalDays: totalDays,
            pricePerDay: car.pricePerDay,
          ),
          SizedBox(height: 20.h),
          const RentalTermsSection(),
        ],
      ),
    );
  }
}
