import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class RentalTermsSection extends StatelessWidget {
  const RentalTermsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 8.0),
      title: const Text(
        'Rental Terms & Conditions',
        style: TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'By proceeding, you agree to our rental agreement and cancellation policy. '
            'Please review the full terms for details on mileage limits, fuel policy, '
            'and potential additional charges. A security deposit will be held on your credit card upon pick-up.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
