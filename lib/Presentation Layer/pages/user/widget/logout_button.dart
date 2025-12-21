import 'package:car_rent/Presentation%20Layer/pages/auth/cubit/login/cubit/login_cubit.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(sl(), sl()),
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<LoginCubit>().logout();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red100,
          foregroundColor: AppColors.red600,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: const Icon(Icons.logout),
        label: const Text(
          "Log Out",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
