import 'package:flutter/material.dart';

class ContactInfoSection extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const ContactInfoSection({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
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
        TextField(
          controller: fullNameController,
          decoration: inputDecoration.copyWith(labelText: "Full Name"),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: emailController,
          readOnly: true,
          decoration: inputDecoration.copyWith(
            labelText: "Email Address",
            suffixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          decoration: inputDecoration.copyWith(
            labelText: "Phone Number",
            prefixText: "+1 ",
            prefixIcon: const Icon(Icons.phone),
          ),
        ),
      ],
    );
  }
}
