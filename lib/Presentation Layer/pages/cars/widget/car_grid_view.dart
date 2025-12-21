import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/widget/car_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarGridView extends StatelessWidget {
  final String selectedType;
  final int userId;

  const CarGridView({
    super.key,
    required this.selectedType,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsCubit, CarsState>(
      builder: (context, state) {
        if (state is CarLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CarError) {
          return Center(child: Text("Error: ${state.errorMessage}"));
        } else if (state is CarLoaded) {
          List<CarEntity> filteredCars = selectedType == "All"
              ? state.cars
              : state.cars.where((car) => car.brand == selectedType).toList();

          if (filteredCars.isEmpty) {
            return const Center(child: Text("No cars found."));
          }

          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 3 / 4.5,
            ),
            itemCount: filteredCars.length,
            itemBuilder: (context, index) {
              final CarEntity car = filteredCars[index];
              return CarItemCard(
                car: car,
                userId: userId,
                isdark:
                    BlocProvider.of<ThemeCubit>(context).state ==
                    ThemeMode.dark,
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
