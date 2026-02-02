import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String transactionId;

  const TransactionCard({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _row(label: 'Transaction ID', value: transactionId, copyable: true),
          const Divider(),
          _row(
            label: 'Status',
            value: 'Completed',
            valueColor: Colors.green,
            leadingDot: true,
          ),
        ],
      ),
    );
  }

  Widget _row({
    required String label,
    required String value,
    Color? valueColor,
    bool copyable = false,
    bool leadingDot = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            letterSpacing: 1,
          ),
        ),
        Row(
          children: [
            if (leadingDot)
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 6),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, color: valueColor),
            ),
            if (copyable)
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(Icons.copy, size: 16, color: Colors.blue),
              ),
          ],
        ),
      ],
    );
  }
}
