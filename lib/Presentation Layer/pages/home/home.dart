import 'package:car_rent/data/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/data/Data%20Layer/repositories/car_repository.dart';
import 'package:car_rent/data/Data%20Layer/repositories/favorites_repository.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_cubit.dart';

import 'package:car_rent/Presentation%20Layer/pages/Favorites/favorites_page.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/pages/booking_history.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/user.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/bottom_navigation_bar.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/custom_app_bar.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/home_content.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(sl<CarRepository>()),
        ),
        BlocProvider<FaveCubit>(
          create: (context) => FaveCubit(
            sl<FavoritesRepository>(),
          ), // Provide your FaveData instance
        ),
        // Note: BookingCubit can be provided in its page only, or here globally
        BlocProvider<BookingCubit>(
          create: (context) => BookingCubit(sl<BookingRepository>()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            const HomeContent(), // now HomeContent can access FaveCubit
            BookingHistoryPage(),
            const FavoritesPage(),
            const ProfileSettingsPage(),
          ],
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
        ),
      ),
    );
  }
}
