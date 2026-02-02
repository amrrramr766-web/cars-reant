import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final VoidCallback onEdit;

  const BookingDetailItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(bottom: 10.h),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondaryLight,
          child: Icon(icon, color: AppColors.secondaryColor),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle1, style: TextStyle(color: AppColors.greyShades[700])),
            Text(
              subtitle2,
              style: TextStyle(color: AppColors.greyShades[600], fontSize: 12),
            ),
          ],
        ),
        trailing: TextButton(
          onPressed: onEdit,
          child: const Text(
            "Edit",
            style: TextStyle(color: AppColors.secondaryColor),
          ),
        ),
      ),
    );
  }
}
