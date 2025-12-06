import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:car_rent/view/widget/favorites/favorite_car_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int userId = 0; // Store userId as a class member variable

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userID") ?? 0; // Update the class member variable
    if (mounted) {
      context.read<FaveCubit>().getData(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF101922)
          : const Color(0xFFF5F7F8),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color:
                    (isDark ? const Color(0xFF101922) : const Color(0xFFF5F7F8))
                        .withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My Favorites",
                    style: TextStyle(
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: BlocBuilder<FaveCubit, FaveState>(
                builder: (context, state) {
                  if (state is FaveLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: isDark ? Colors.white : const Color(0xFF7C3AED),
                      ),
                    );
                  } else if (state is FaveError) {
                    return Center(child: Text(state.message));
                  }

                  final popularCars = context
                      .read<FaveCubit>()
                      .favorites
                      .map((e) => e.toCarModel())
                      .toList();

                  if (popularCars.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.garage_outlined,
                            size: 80.sp,
                            color: isDark ? Colors.grey[500] : Colors.grey[400],
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            "Your Garage is Empty",
                            style: TextStyle(
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF0F172A),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Start exploring and save the cars you like.\nWe'll keep them here for you.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isDark
                                  ? Colors.grey[400]
                                  : Colors.grey[600],
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    itemCount: popularCars.length,
                    itemBuilder: (context, index) {
                      final car = popularCars[index];
                      return FavoriteCarCard(car: car, userId: userId);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
