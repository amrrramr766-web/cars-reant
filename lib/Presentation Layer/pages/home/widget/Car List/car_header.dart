import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CarHeader extends StatelessWidget {
  final CarEntity car;
  final bool isdark;

  const CarHeader({super.key, required this.car, required this.isdark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          car.brand,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: isdark ? AppColors.textDarkPrimary : AppColors.black,
          ),
        ),
        Text(
          '\$${car.pricePerDay}/day',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: isdark ? AppColors.accentTealDark : AppColors.deepPurple,
          ),
        ),
      ],
    );
  }
}

class CarSpecs extends StatelessWidget {
  final CarEntity car;
  final bool isdark;

  const CarSpecs({super.key, required this.car, required this.isdark});
  @override
  Widget build(BuildContext context) {
    return Text(
      '${car.model} • ${car.year} • ${car.gear} • ${car.gas}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.sp,
        color: isdark ? AppColors.textDarkSecondary : AppColors.grey700,
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  final CarEntity car;
  final bool isdark;

  const SelectButton({super.key, required this.car, required this.isdark});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: car.isAvailable
            ? () {
                context.push('${AppRoute.carDetail}/${car.id}', extra: car);
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isdark
              ? AppColors.accentBlueDark
              : AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: const Text(
          'Select Car',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white),
        ),
      ),
    );
  }
}
