import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/cubit/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarHeader extends StatelessWidget {
  final CarEntity car;
  final bool isdark;

  const CarHeader({required this.car, required this.isdark});

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

  const CarSpecs({required this.car, required this.isdark});
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

  const SelectButton({required this.car, required this.isdark});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: car.isAvailable
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) {
                        final cubit = sl<CarDeteailDartCubit>();
                        cubit.fetchReviews(car.id);
                        return cubit;
                      },
                      child: CarDetailsPage(car: car),
                    ),
                  ),
                );
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
