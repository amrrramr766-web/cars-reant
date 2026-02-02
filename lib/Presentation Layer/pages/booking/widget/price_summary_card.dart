import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceSummaryCard extends StatelessWidget {
  final int totalDays;
  final double pricePerDay;

  const PriceSummaryCard({
    super.key,
    required this.totalDays,
    required this.pricePerDay,
  });

  @override
  Widget build(BuildContext context) {
    final double totalPrice = totalDays * pricePerDay;
    const taxesAndFees = 35.20;
    const cdw = 40.0;
    const gps = 15.0;
    final double grandTotal = totalPrice + taxesAndFees + cdw + gps;

    Widget priceRow(String label, String value, {bool bold = false}) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.greyShades[700],
                fontSize: 13.sp,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            priceRow(
              "Rental fee ($totalDays days x \$${pricePerDay.toStringAsFixed(2)})",
              "\$${totalPrice.toStringAsFixed(2)}",
            ),
            priceRow("Taxes & Fees", "\$${taxesAndFees.toStringAsFixed(2)}"),
            priceRow("Collision Damage Waiver", "\$${cdw.toStringAsFixed(2)}"),
            priceRow("GPS Navigation", "\$${gps.toStringAsFixed(2)}"),
            Divider(height: 20.h, color: AppColors.greyShades[400]),
            priceRow(
              "Total Cost",
              "\$${grandTotal.toStringAsFixed(2)}",
              bold: true,
            ),
          ],
        ),
      ),
    );
  }
}
