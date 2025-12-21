import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class BookingReviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookingReviewAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteWithOpacity(0.9),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.black),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: const Text(
        "Review Your Booking",
        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
