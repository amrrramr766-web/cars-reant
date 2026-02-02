import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarImage extends StatelessWidget {
  final CarEntity car;
  final bool isdark;

  const CarImage({required this.car, required this.isdark});

  @override
  Widget build(BuildContext context) {
    final placeholderColor = isdark
        ? AppColors.surfaceDarkElevated
        : AppColors.backgroundLighter;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: car.imageUrl.isNotEmpty
          ? Image.network(
              car.imageUrl,
              height: 160.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => _placeholder(placeholderColor),
            )
          : _placeholder(placeholderColor),
    );
  }

  Widget _placeholder(Color color) {
    return Container(
      height: 160.h,
      color: color,
      child: Icon(
        Icons.directions_car,
        size: 48,
        color: isdark ? AppColors.textDarkHint : AppColors.textHint,
      ),
    );
  }
}
