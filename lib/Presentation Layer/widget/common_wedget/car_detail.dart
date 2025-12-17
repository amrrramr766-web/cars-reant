import 'package:car_rent/Presentation%20Layer/controller/car_delteal/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetail extends StatelessWidget {
  final CarModel car;
  const CarDetail({super.key, required this.car});

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
                    cubit.fetchReviews(car.carID!);
                    return cubit;
                  },
                  child: CarDetailsPage(car: car),
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
