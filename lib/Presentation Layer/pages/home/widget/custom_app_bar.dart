import 'package:car_rent/Presentation%20Layer/controller/search/cubit/search_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/search_page.dart';
import 'package:car_rent/data/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/data/Data%20Layer/model/user_model.dart';
import 'package:car_rent/data/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/cubit/login/cubit/login_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/user.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/core/constant/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDark;
  final AuthLocalDataSource authLocalDataSource = sl<AuthLocalDataSource>();

  CustomAppBar({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          // If logged in via Cubit
          String userName = (state is LoginSuccess) ? state.name : "Guest";

          // Use FutureBuilder to override userName if stored locally
          return FutureBuilder<UserModel>(
            future: authLocalDataSource.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                userName = snapshot.data!.fullName;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: SafeArea(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) =>
                                BookingCubit(sl<BookingRepository>()),
                            child: const ProfileSettingsPage(),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColors.deepPurple200,
                              child: Text(
                                userName.isNotEmpty
                                    ? userName.characters.first.toUpperCase()
                                    : "G",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Welcome 👋",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Notification + Search
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications),
                            ),
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                final searchCubit = sl<SearchCubit>();

                                showSearch(
                                  context: context,
                                  delegate: SearchPage(
                                    searchCubit: searchCubit,
                                    isDark: isDark,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
