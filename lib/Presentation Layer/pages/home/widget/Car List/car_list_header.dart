import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:go_router/go_router.dart';

class CarListHeader extends StatelessWidget {
  final String title;
  const CarListHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        TextButton(
          onPressed: () => context.push(AppRoute.brawesCars),
          child: Text(
            'See more',
            style: TextStyle(
              color: Theme.of(context).tabBarTheme.indicatorColor,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
