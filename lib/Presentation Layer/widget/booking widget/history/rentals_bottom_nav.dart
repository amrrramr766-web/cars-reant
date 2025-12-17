import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class RentalsBottomNav extends StatelessWidget {
  final int currentIndex;

  const RentalsBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (_) {},
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: isDark ? AppColors.grey400 : AppColors.greySecondary,
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLightAlt,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.key_rounded),
          label: "My Rentals",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
