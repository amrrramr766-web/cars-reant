import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/cubit/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetail extends StatelessWidget {
  final CarEntity car;
  final bool isDark;
  const CarDetail({super.key, required this.car, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: SizedBox(
        width: double.infinity,
        height: 36.h,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) {
                    final cubit = sl<CarDeteailDartCubit>();
                    cubit.fetchReviews(car.id);
                    return cubit;
                  },
                  child: CarDetailsPage(car: car, isDark: isDark),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            "Details",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
