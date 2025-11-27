import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class CarInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const CarInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
