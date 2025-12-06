import 'package:car_rent/controller/auth/login/cubit/login_cubit.dart';
import 'package:car_rent/controller/home/cubit/home_cubit.dart';
import 'package:car_rent/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:car_rent/core/constant/app_theme.dart';
import 'package:car_rent/server_locator.dart';
import 'package:car_rent/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:car_rent/l10n/app_localizations.dart';
import 'package:car_rent/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(create: (_) => sl<SearchCubit>()),
        BlocProvider<HomeCubit>(create: (_) => sl<HomeCubit>()..fetchCars()),
        BlocProvider<LoginCubit>(
          create: (_) => sl<LoginCubit>()..loadUserFromPrefs(),
        ),
        BlocProvider<ThemeCubit>(create: (_) => sl<ThemeCubit>()..loadTheme()),
        BlocProvider<FaveCubit>(create: (_) => sl<FaveCubit>()),
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
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'car rent',
        themeMode: state,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,

        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        home: const SplashScreen(),
        routes: routes,
      ),
    );
  }
}
