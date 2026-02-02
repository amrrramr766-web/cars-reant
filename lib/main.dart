import 'package:car_rent/Presentation%20Layer/pages/auth/cubit/auth/cubit/auth_cubit.dart';
import 'package:car_rent/app.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>(), // only create once
        ),

        BlocProvider<ThemeCubit>(
          create: (_) => sl<ThemeCubit>()..setTheme(ThemeMode.system),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => const MyApp(),
      ),
    ),
  );
}
