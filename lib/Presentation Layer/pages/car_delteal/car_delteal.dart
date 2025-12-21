import 'package:car_rent/data/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/wid%20get/car_bottom_bar.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/wid%20get/car_features.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/wid%20get/car_images_slider.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/wid%20get/car_location.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/wid%20get/car_reviews_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/wid%20get/car_specifications.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarDetailsPage extends StatefulWidget {
  final CarEntity car;
  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  int userId = 0;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt("userID") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaveCubit(sl<FavoritesRepository>()),
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF101C22)
            : const Color(0xFFF5F7F8),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CarImagesSlider(car: widget.car),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.car.brand} ${widget.car.model}',
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),

                      Text(
                        widget.car.year.toString(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      CarSpecifications(car: widget.car),
                      SizedBox(height: 20.h),
                      CarFeatures(),
                      SizedBox(height: 20.h),
                      CarReviewsSection(),
                      SizedBox(height: 25.h),
                      CarLocation(),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CarBottomBar(car: widget.car),
      ),
    );
  }
}
