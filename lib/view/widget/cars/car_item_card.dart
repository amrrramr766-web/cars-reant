import 'package:car_rent/view/pages/car_delteal/car_delteal.dart';
import 'package:car_rent/view/widget/common_wedget/fave_button.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rent/data/model/car_model.dart';
import 'package:car_rent/controller/car_delteal/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarItemCard extends StatelessWidget {
  final CarModel car;
  final int userId;

  const CarItemCard({super.key, required this.car, required this.userId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  // صورة السيارة
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.r),
                    ),
                    child: Image.network(
                      car.imageUrl!,
                      height:
                          constraints.maxHeight * 0.5, // 40% من ارتفاع الكارد
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  faveButton(
                    userId: userId,
                    carId: car.carID!,
                    isFavorited: car.isFave ?? false,
                  ),
                ],
              ),

              SizedBox(height: 8.h),

              // اسم السيارة والحالة
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    Text(
                      car.brand!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      car.isAvailable! ? "Available" : "Not Available",
                      style: TextStyle(
                        color: car.isAvailable!
                            ? AppColors.green700
                            : AppColors.red700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
