// widgets/car_type_filter_chips.dart
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:car_rent/core/constant/app_colors.dart';

class CarTypeFilterChips extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeSelected;
  final bool isDark;

  const CarTypeFilterChips({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: BlocBuilder<CarsCubit, CarsState>(
        builder: (context, state) {
          final Set<String> carTypes = {"All"};

          if (state is CarLoaded) {
            final cars = state.cars;

            for (final car in cars) {
              carTypes.add(car.brand);
            }
          }

          final typesList = carTypes.toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            itemCount: typesList.length,
            itemBuilder: (context, index) {
              final type = typesList[index];
              final isSelected = selectedType == type;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: ChoiceChip(
                  label: Text(
                    type,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: AppColors.primaryColor,
                  backgroundColor: isDark
                      ? AppColors.surfaceDark
                      : AppColors.greyShades[200],
                  labelStyle: TextStyle(
                    color: isSelected
                        ? AppColors.white
                        : (isDark ? AppColors.white : AppColors.black),
                  ),
                  onSelected: (_) => onTypeSelected(type),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
