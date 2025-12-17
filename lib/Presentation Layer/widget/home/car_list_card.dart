import 'package:car_rent/Presentation%20Layer/controller/car_delteal/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarListCard extends StatelessWidget {
  final List<CarModel> cars;
  final bool isdark;
  const CarListCard({super.key, required this.cars, required this.isdark});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: cars.length,
      itemBuilder: (context, index) {
        final car = cars[index];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Stack(
            children: [
              Container(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child:
                            (car.imageUrl != null && car.imageUrl!.isNotEmpty)
                            ? Image.network(
                                car.imageUrl!,
                                width: double.infinity,
                                height: 160.h,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 160.h,
                                      color: isdark
                                          ? AppColors.surfaceDarkElevated
                                          : AppColors.backgroundLighter,
                                      child: Center(
                                        child: Icon(
                                          Icons.directions_car,
                                          size: 48,
                                          color: isdark
                                              ? AppColors.textDarkHint
                                              : AppColors.textHint,
                                        ),
                                      ),
                                    ),
                              )
                            : Container(
                                height: 160.h,
                                color: isdark
                                    ? AppColors.surfaceDarkElevated
                                    : AppColors.backgroundLighter,
                                child: Center(
                                  child: Icon(
                                    Icons.directions_car,
                                    size: 48,
                                    color: isdark
                                        ? AppColors.textDarkHint
                                        : AppColors.textHint,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            car.brand!,
                            style: TextStyle(
                              color: isdark
                                  ? AppColors.textDarkPrimary
                                  : AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '\$${car.pricePerDay}/day',
                            style: TextStyle(
                              color: isdark
                                  ? AppColors.accentTealDark
                                  : AppColors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${car.model} • ${car.year} • ${car.gear} • ${car.gas}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: isdark
                              ? AppColors.textDarkSecondary
                              : AppColors.grey700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isdark
                                ? AppColors.accentBlueDark
                                : AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: (car.isAvailable ?? false)
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) {
                                          final cubit =
                                              sl<CarDeteailDartCubit>();
                                          cubit.fetchReviews(car.carID!);
                                          return cubit;
                                        },
                                        child: CarDetailsPage(car: car),
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          child: Text(
                            (car.isAvailable ?? false)
                                ? 'Select Car'
                                : 'Unavailable',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!(car.isAvailable ?? false))
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.blackWithOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Center(
                      child: Text(
                        "Not Available",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
