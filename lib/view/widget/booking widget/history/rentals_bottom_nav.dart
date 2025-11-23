import 'package:flutter/material.dart';

class RentalsBottomNav extends StatelessWidget {
  final int currentIndex;

  const RentalsBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (_) {},
      selectedItemColor: const Color(0xFF0B95DA),
      unselectedItemColor: isDark ? Colors.grey[400] : const Color(0xFF6C757D),
      backgroundColor: isDark
          ? const Color(0xFF101C22)
          : const Color(0xFFF5F7F8),
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
