import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/car_detail.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/fave_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCarCard extends StatelessWidget {
  final CarEntity car;
  const FavoriteCarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Section
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: (car.imageUrl.isNotEmpty)
                  ? Image.network(
                      car.imageUrl,
                      height: 180.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180.h,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(
                            Icons.directions_car,
                            size: 48.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 180.h,
                      color: Colors.grey[300],
                      child: Center(
                        child: Icon(
                          Icons.directions_car,
                          size: 48.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ],
        ),
        // Content Section
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${car.year} ${car.brand} ${car.model}",
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[400]
                              : Colors.grey[500],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${car.pricePerDay.toStringAsFixed(0)}",
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : const Color(0xFF0F172A), // slate-900
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 200.w),
                          faveButton(
                            carId: car.id,
                            isFavorited: car.isFavorite,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                "${car.gear} • ${car.gas} • ${car.seat} Seats",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[300]
                      : Colors.grey[600],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12.h),
              CarDetail(car: car),
            ],
          ),
        ),
      ],
    );
  }
}
