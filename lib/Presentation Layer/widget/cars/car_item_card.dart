import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:car_rent/Presentation%20Layer/widget/common_wedget/fave_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Presentation%20Layer/controller/car_delteal/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarItemCard extends StatelessWidget {
  final CarModel car;
  final int userId;
  final bool isdark;

  const CarItemCard({
    super.key,
    required this.car,
    required this.userId,
    required this.isdark,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: isdark ? AppColors.surfaceDark : AppColors.white,
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
                    child: (car.imageUrl != null && car.imageUrl!.isNotEmpty)
                        ? Image.network(
                            car.imageUrl!,
                            height:
                                constraints.maxHeight *
                                0.5, // 40% من ارتفاع الكارد
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: constraints.maxHeight * 0.5,
                                  color: isdark
                                      ? AppColors.backgroundDark
                                      : AppColors.backgroundLight,
                                  child: const Center(
                                    child: Icon(
                                      Icons.directions_car,
                                      size: 48,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ),
                          )
                        : Container(
                            height: constraints.maxHeight * 0.5,
                            color: isdark
                                ? AppColors.surfaceDarkElevated
                                : AppColors.backgroundLight,
                            child: const Center(
                              child: Icon(
                                Icons.directions_car,
                                size: 48,
                                color: AppColors.grey,
                              ),
                            ),
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
                        color: isdark ? AppColors.white : AppColors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      car.isAvailable! ? "Available" : "Not Available",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isdark ? AppColors.white : AppColors.black,
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
                      backgroundColor: isdark
                          ? AppColors.darkPurple
                          : AppColors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: isdark ? AppColors.white : AppColors.black,
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
