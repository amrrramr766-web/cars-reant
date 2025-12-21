import 'package:car_rent/data/Data%20Layer/repositories/auth_repository.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/cubit/user_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/personalDetail/personal_detail_page.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/custom_list_title.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => UserCubit(sl<AuthRepository>()),
                    child: PersonalDetailsPage(),
                  ),
                ),
              );
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
