// browse_cars.dart
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/widget/car_grid_view.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/widget/car_type_filter_chips.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowseCars extends StatefulWidget {
  const BrowseCars({super.key});

  @override
  State<BrowseCars> createState() => _BrowseCarsState();
}

class _BrowseCarsState extends State<BrowseCars> {
  String selectedType = "All";

  Future<void> _refreshCars(int pageNumber, int pageSize) async {
    await context.read<CarsCubit>().fetchCarsPage(pageNumber);
  }

  @override
  void initState() {
    super.initState();
    context.read<CarsCubit>().fetchCarsPage(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
        backgroundColor: context.watch<ThemeCubit>().state == ThemeMode.dark
            ? AppColors.darkPurple
            : AppColors.primaryLight,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshCars(1, 10),
        child: CustomScrollView(
          slivers: [
            /// Filter chips (RenderBox → Sliver)
            ///
            SliverToBoxAdapter(
              child: CarTypeFilterChips(
                selectedType: selectedType,
                onTypeSelected: (type) {
                  setState(() {
                    selectedType = type;
                  });
                },
                isDark: context.watch<ThemeCubit>().state == ThemeMode.dark,
              ),
            ),

            /// Spacing
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),

            CarGridView(
              selectedType: selectedType,
              isDark: context.watch<ThemeCubit>().state == ThemeMode.dark,
            ),
          ],
        ),
      ),
    );
  }
}
