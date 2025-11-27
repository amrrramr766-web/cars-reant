import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.blueAccent,
      unselectedItemColor: AppColors.grey,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_online),
          label: "Bookings",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
      ],
    );
  }
}
