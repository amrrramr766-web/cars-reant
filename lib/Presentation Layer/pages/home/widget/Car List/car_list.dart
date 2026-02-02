import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_list_header.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarList extends StatelessWidget {
  final List<CarEntity> cars;
  final String title;

  const CarList({super.key, required this.cars, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    // Note: This widget should be used inside a CustomScrollView
    // It returns a sliver widget, not a box widget
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(child: CarListHeader(title: title)),
        CarListItems(isdark: isDark),
      ],
    );
  }
}
