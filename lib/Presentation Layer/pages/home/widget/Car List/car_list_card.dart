import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_header.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_image.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarListCard extends StatelessWidget {
  final List<CarEntity> cars;
  final bool isdark;

  const CarListCard({super.key, required this.cars, required this.isdark});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return _CarCard(car: cars[index], isdark: isdark);
      },
    );
  }
}

class _CarCard extends StatelessWidget {
  final CarEntity car;
  final bool isdark;

  const _CarCard({required this.car, required this.isdark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Stack(
        children: [
          _buildCard(context),
          if (!car.isAvailable) _buildUnavailableOverlay(),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isdark ? AppColors.surfaceDark : AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: isdark
                ? AppColors.blackWithOpacity(0.4)
                : AppColors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarImage(car: car, isdark: isdark),
            SizedBox(height: 8.h),
            CarHeader(car: car, isdark: isdark),
            SizedBox(height: 4.h),
            CarSpecs(car: car, isdark: isdark),
            SizedBox(height: 12.h),
            SelectButton(car: car, isdark: isdark),
          ],
        ),
      ),
    );
  }

  Widget _buildUnavailableOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blackWithOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: const Center(
          child: Text(
            'Not Available',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
