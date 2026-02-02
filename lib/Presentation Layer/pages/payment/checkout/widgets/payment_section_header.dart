import 'package:flutter/material.dart';

class PaymentSectionHeader extends StatelessWidget {
  const PaymentSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Payment Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.credit_card, color: Colors.grey),
        ],
      ),
    );
  }
}
