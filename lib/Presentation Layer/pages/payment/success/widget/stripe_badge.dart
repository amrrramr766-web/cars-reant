import 'package:flutter/material.dart';

class StripeBadge extends StatelessWidget {
  const StripeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.lock, size: 14, color: Colors.grey),
        SizedBox(width: 6),
        Text(
          'Securely processed by Stripe',
          style: TextStyle(fontSize: 12, letterSpacing: 1, color: Colors.grey),
        ),
      ],
    );
  }
}
