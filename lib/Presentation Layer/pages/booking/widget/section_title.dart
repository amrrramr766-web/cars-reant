import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
