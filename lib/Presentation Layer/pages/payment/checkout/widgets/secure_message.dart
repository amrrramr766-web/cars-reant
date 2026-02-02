import 'package:flutter/material.dart';

class SecureMessage extends StatelessWidget {
  const SecureMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.lock, size: 16, color: Colors.green),
          SizedBox(width: 6),
          Text(
            'Your payment is encrypted and secured by Stripe',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
