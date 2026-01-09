import 'package:flutter/material.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/custom_list_title.dart';

import 'package:go_router/go_router.dart';
import 'package:car_rent/core/constant/app_route.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CustomListTile(
            icon: Icons.person,
            title: "Personal Details",
            onTap: () async {
              context.push(AppRoute.personalDetails);
            },
          ),

          Divider(height: 0),
          CustomListTile(
            icon: Icons.credit_card,
            title: "Payment Methods",
            onTap: () {},
          ),
          Divider(height: 0),
          CustomListTile(icon: Icons.badge, title: "Driving License"),
        ],
      ),
    );
  }
}
