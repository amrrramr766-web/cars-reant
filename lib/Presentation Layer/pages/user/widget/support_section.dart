import 'package:car_rent/Presentation%20Layer/pages/user/widget/custom_list_title.dart';
import 'package:flutter/material.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: const [
          CustomListTile(icon: Icons.help_center, title: "Help Center"),
          Divider(height: 0),
          CustomListTile(icon: Icons.gavel, title: "Terms of Service"),
        ],
      ),
    );
  }
}
