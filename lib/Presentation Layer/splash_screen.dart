import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/cubit/auth/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:car_rent/core/constant/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger auth check only when widget is built
    context.read<AuthCubit>().checkAuth();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: () => context.go(AppRoute.home),
          unauthenticated: () => context.go(AppRoute.login),
        );
      },
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
