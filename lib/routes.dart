import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/controller/theme/cubit/theme_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/logic/auth/cubit/auth_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/pages/booking_history.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/cubit/cubit/car_deteail_dart_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/cubit/cubit/cars_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/checkout/page/checkout_page.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/checkout/helper/checkout_args.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/success/payment_success_page.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/cubit/user_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/personalDetail/personal_detail_page.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/pages/success_booking.dart';
import 'package:car_rent/Presentation%20Layer/splash_screen.dart';
import 'package:car_rent/core/helper/go_router_refresh_stream%20.dart';
import 'package:car_rent/Data%20Layer/repositories/auth_repository.dart';

import 'package:car_rent/Presentation%20Layer/widget/common/route_error_page.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/pages/login.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/pages/regster.dart';
import 'package:car_rent/Presentation%20Layer/pages/car_delteal/car_delteal.dart';
import 'package:car_rent/Presentation%20Layer/pages/cars/brawes_cars.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/home.dart';
import 'package:car_rent/Presentation%20Layer/pages/onBording/on_bording_screen.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoute.splash,

  refreshListenable: GoRouterRefreshStream(sl<AuthCubit>().stream),
  redirect: (context, state) {
    final auth = sl<AuthCubit>().state;

    return auth.maybeWhen(
      initial: () => AppRoute.splash,
      unauthenticated: () {
        if (![
          AppRoute.login,
          AppRoute.register,
        ].contains(state.uri.toString())) {
          return AppRoute.login;
        }
        return null;
      },
      authenticated: () {
        if ([
          AppRoute.login,
          AppRoute.register,
        ].contains(state.uri.toString())) {
          return AppRoute.home;
        }
        return null;
      },
      orElse: () => null,
    );
  },

  routes: [
    GoRoute(path: AppRoute.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoute.login, builder: (_, __) => LoginScreen()),
    GoRoute(path: AppRoute.register, builder: (_, __) => RegisterScreen()),
    GoRoute(
      path: AppRoute.onBoarding,
      builder: (context, state) => OnBordingScreen(),
    ),
    GoRoute(
      path: AppRoute.home,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<CarsCubit>()..fetchCarsPage(1),
        child: const Home(),
      ),
    ),
    GoRoute(
      path: AppRoute.brawesCars,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<CarsCubit>()..fetchCarsPage(1),
        child: const BrowseCars(),
      ),
    ),
    GoRoute(
      name: AppRoute.bookingHistory,
      path: AppRoute.bookingHistory,
      builder: (context, state) => const BookingHistoryPage(),
    ),

    GoRoute(
      path: '${AppRoute.carDetail}/:carId',
      builder: (context, state) {
        final car = state.extra as CarEntity?;
        if (car == null) {
          return const RouteErrorPage(message: 'Invalid car data');
        }
        return BlocProvider(
          create: (_) {
            final cubit = sl<CarDeteailDartCubit>();
            cubit.fetchReviews(car.id);
            return cubit;
          },
          child: CarDetailsPage(
            car: car,
            isDark: context.watch<ThemeCubit>().state == ThemeMode.dark,
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoute.personalDetails,
      builder: (context, state) => BlocProvider(
        create: (_) => UserCubit(sl<AuthRepository>()),
        child: PersonalDetailsPage(),
      ),
    ),
    GoRoute(
      path: AppRoute.successBooking,
      builder: (_, __) => const SuccessBooking(),
    ),
    GoRoute(
      path: AppRoute.checkout,
      builder: (context, state) {
        final args = state.extra as CheckoutArgs?;
        if (args == null) {
          return const RouteErrorPage(message: 'Invalid checkout data');
        }
        return CheckoutPage(
          image: args.image,
          name: args.name,
          date: args.date,
          price: args.price,
        );
      },
    ),
    GoRoute(
      path: AppRoute.paymentSuccess,
      builder: (context, state) {
        final args = state.extra as CheckoutArgs?;
        if (args == null) {
          return const RouteErrorPage(message: 'Invalid payment data');
        }

        return PaymentSuccessPage(
          transactionId:
              args.transactionId ??
              "MOCK-${DateTime.now().millisecondsSinceEpoch}",
          carName: args.name,
          dateRange: args.date,
          location: "Dubai, UAE", // Default or could be added to args
          imageUrl: args.image,
          price: args.price,
        );
      },
    ),
  ],
);
