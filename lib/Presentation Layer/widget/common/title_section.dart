import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.grey,
      ),
    );
  }
}
