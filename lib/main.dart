import 'dart:ui';

import 'package:car_rent/controller/auth/login/cubit/login_cubit.dart';
import 'package:car_rent/controller/home/cubit/home_cubit.dart';
import 'package:car_rent/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/data/data_source/remote/auth/login.dart';
import 'package:car_rent/data/data_source/remote/search_data.dart';
import 'package:car_rent/data/model/car_model.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:car_rent/l10n/app_localizations.dart';
import 'package:car_rent/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SearchCubit(SearchData(Crud()))),
        BlocProvider<HomeCubit>(create: (_) => sl<HomeCubit>()..fetchCars()),
        BlocProvider<LoginCubit>(
          create: (context) =>
              LoginCubit(LoginData(Crud()))..loadUserFromPrefs(),
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale deviceLocale = PlatformDispatcher.instance.locale;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'car rent',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          error: AppColors.errorColor,
          surface: AppColors.white,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onSurface: AppColors.textPrimary,
        ),
      ),

      locale: deviceLocale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return const Locale('en');

        for (final supported in supportedLocales) {
          if (supported.languageCode == locale.languageCode) {
            return supported;
          }
        }
        return const Locale('en'); // fallback
      },

      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const SplashScreen(),
      routes: routes,
    );
  }
}
