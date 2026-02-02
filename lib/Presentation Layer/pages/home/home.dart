import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/Presentation%20Layer/controller/user/cubit/user_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/favorites_page.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/pages/booking_history.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/cubit/cubit/home_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/custom_app_bar.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/home_content.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/user.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/server_locator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return BlocProvider(
          create: (_) => sl<HomeCubit>(),
          child: const HomeContent(),
        );

      case 1:
        return BlocProvider(
          create: (_) => sl<BookingCubit>(),
          child: const BookingHistoryPage(),
        );
      case 2:
        return BlocProvider(
          create: (_) => sl<FaveCubit>(),
          child: const FavoritesPage(),
        );
      case 3:
        return BlocProvider(
          create: (_) => sl<UserCubit>(),
          child: const ProfileSettingsPage(),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDark: context.watch<ThemeCubit>().state == ThemeMode.dark,
      ),
      body: _buildBody(),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
