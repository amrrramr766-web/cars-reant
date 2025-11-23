import 'package:car_rent/controller/user/cubit/user_cubit.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/data/data_source/remote/user/user.dart';
import 'package:car_rent/view/pages/personalDetail/personal_detail_page.dart';
import 'package:car_rent/view/widget/user/custom_listT_tle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt("userID") ?? 0;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => UserCubit(UserData(Crud())),
                    child: PersonalDetailsPage(userId: userId),
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
