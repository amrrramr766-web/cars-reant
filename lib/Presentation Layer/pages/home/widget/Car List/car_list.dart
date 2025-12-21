import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarList extends StatelessWidget {
  final List<CarEntity> cars;
  final String title;

  const CarList({super.key, required this.cars, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.brawesCars);
              },
              child: Text(
                'See more',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),

        // Horizontal list of cars
        CarListCard(
          cars: cars,
          isdark: BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark,
        ),
      ],
    );
  }
}
