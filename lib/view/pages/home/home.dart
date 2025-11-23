import 'package:car_rent/controller/bookin_cubit/cubit/booking_cubit.dart';
import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:car_rent/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/data/data_source/remote/booking/booking_data.dart';
import 'package:car_rent/data/data_source/remote/fave/fave_data.dart';
import 'package:car_rent/data/data_source/remote/search_data.dart';
import 'package:car_rent/view/pages/bookingPage/booking_history.dart';
import 'package:car_rent/view/pages/user/user.dart';
import 'package:car_rent/view/widget/home/custom_app_bar.dart';
import 'package:car_rent/view/widget/home/home_content.dart';
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
          create: (context) => SearchCubit(SearchData(Crud())),
        ),
        BlocProvider<FaveCubit>(
          create: (context) =>
              FaveCubit(FaveData(Crud())), // Provide your FaveData instance
        ),
        // Note: BookingCubit can be provided in its page only, or here globally
        BlocProvider<BookingCubit>(
          create: (context) => BookingCubit(BookingData(Crud())),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeContent(), // now HomeContent can access FaveCubit
            BookingHistoryPage(),
            ProfileSettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: _onNavTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: "Bookings",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        ),
      ),
    );
  }
}
