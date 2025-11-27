import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red100,
        foregroundColor: AppColors.red600,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      icon: const Icon(Icons.logout),
      label: const Text(
        "Log Out",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
