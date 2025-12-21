import 'package:flutter/material.dart';

class RentalsTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const RentalsTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget buildTab(String text, int index) {
      final selected = selectedIndex == index;
      return Expanded(
        child: GestureDetector(
          onTap: () => onTabChanged(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: selected
                      ? const Color(0xFF0B95DA)
                      : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected
                    ? const Color(0xFF0B95DA)
                    : (isDark ? Colors.grey[400] : const Color(0xFF6C757D)),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      color: isDark ? const Color(0xFF101C22) : const Color(0xFFF5F7F8),
      child: Row(children: [buildTab('Current', 0), buildTab('Past', 1)]),
    );
  }
}
