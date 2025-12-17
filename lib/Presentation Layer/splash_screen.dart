import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:car_rent/core/middleware/cubit/middlewaer_cubit.dart';

class SplashScreen extends StatelessWidget {
  final AuthLocalDataSource authLocalDataSource;

  const SplashScreen({super.key, required this.authLocalDataSource});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MiddlewaerCubit(authLocalDataSource: authLocalDataSource)
            ..checkStep(), // ✅ هنا فقط
      child: BlocListener<MiddlewaerCubit, MiddlewaerState>(
        listener: (context, state) {
          if (state is AppGoHome) {
            Navigator.pushReplacementNamed(context, AppRoute.home);
          } else if (state is AppGoLogin) {
            Navigator.pushReplacementNamed(context, AppRoute.login);
          } else if (state is AppGoOnBoarding) {
            Navigator.pushReplacementNamed(context, AppRoute.onBoarding);
          }
        },
        child: const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
