import 'package:car_rent/Presentation%20Layer/pages/booking/widget/price_summary_card.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/widget/section_title.dart';
import 'package:flutter/material.dart';

class PriceSummarySection extends StatelessWidget {
  final int totalDays;
  final double pricePerDay;

  const PriceSummarySection({
    super.key,
    required this.totalDays,
    required this.pricePerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Price Summary'),
        PriceSummaryCard(totalDays: totalDays, pricePerDay: pricePerDay),
      ],
    );
  }
}
