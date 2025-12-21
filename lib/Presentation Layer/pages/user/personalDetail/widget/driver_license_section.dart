import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DriverLicenseSection extends StatelessWidget {
  final TextEditingController licenseNumberController;
  final TextEditingController countryController;
  final DateTime? expiryDate;
  final Function(DateTime) onDatePicked;

  const DriverLicenseSection({
    required this.licenseNumberController,
    required this.countryController,
    required this.expiryDate,
    required this.onDatePicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // License Number
        TextField(
          controller: licenseNumberController,
          decoration: inputDecoration.copyWith(labelText: "License Number"),
        ),
        const SizedBox(height: 16),

        // Issuing Country/State as TextField
        TextField(
          controller: countryController,
          decoration: inputDecoration.copyWith(
            labelText: "Issuing Country/State",
          ),
        ),
        const SizedBox(height: 16),

        // Expiry Date
        TextField(
          readOnly: true,
          decoration: inputDecoration.copyWith(
            labelText: "Expiry Date",
            suffixIcon: const Icon(Icons.calendar_today),
            hintText: expiryDate == null
                ? "MM/DD/YYYY"
                : DateFormat.yMd().format(expiryDate!),
          ),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: expiryDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) onDatePicked(picked);
          },
        ),
      ],
    );
  }
}
