import 'package:car_rent/Presentation%20Layer/pages/payment/checkout/widgets/booking_summary_card.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/success/widget/payment_actions.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/success/widget/stripe_badge.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/success/widget/success_header.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/success/widget/transaction_card.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String transactionId;
  final String carName;
  final String dateRange;
  final String location;
  final String imageUrl;
  final String price;

  const PaymentSuccessPage({
    super.key,
    required this.transactionId,
    required this.carName,
    required this.dateRange,
    required this.location,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        title: const Text(
          'Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const SuccessHeader(),
                  const SizedBox(height: 32),
                  TransactionCard(transactionId: transactionId),
                  const SizedBox(height: 24),
                  BookingSummaryCard(
                    image: imageUrl,
                    name: carName,
                    date: dateRange,
                    price: '',
                  ),
                  const SizedBox(height: 32),
                  const StripeBadge(),
                ],
              ),
            ),
          ),
          const PaymentActions(),
        ],
      ),
    );
  }
}
