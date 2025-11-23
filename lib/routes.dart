import 'package:car_rent/controller/cars/cubit/cars_cubit.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:car_rent/data/model/car_model.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/view/pages/auth/login.dart';
import 'package:car_rent/view/pages/auth/regster.dart';
import 'package:car_rent/view/pages/car_delteal/car_delteal.dart';
import 'package:car_rent/view/pages/cars/brawes_cars.dart';
import 'package:car_rent/view/pages/home/home.dart';
import 'package:car_rent/view/pages/onBording/on_bording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// صفحة خطأ في حال arguments مفقودة
class RouteErrorPage extends StatelessWidget {
  final String message;
  const RouteErrorPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => LoginScreen(),
  AppRoute.register: (context) => RegisterScreen(),
  AppRoute.onBoarding: (context) => OnBordingScreen(),

  /// 🔥 Car Detail Page مع فحص arguments قبل الاستخدام
  AppRoute.carDetail: (context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is CarModel) {
      return CarDetailsPage(car: args);
    }
    // Fallback: return error screen if args missing
    return const Scaffold(body: Center(child: Text('Invalid car data')));
  },

  /// Browse Cars مع Cubit + fetchCars()
  AppRoute.brawesCars: (context) => BlocProvider(
    create: (_) => sl<CarsCubit>()..fetchCars(),
    child: const BrowseCars(),
  ),

  AppRoute.home: (context) => const Home(),
};
