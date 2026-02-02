import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/Data%20Layer/model/user_model.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/title_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/account_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/logout_button.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/preferences_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/support_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/widget/user_profile_header.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final AuthLocalDataSource authLocalDataSource = sl<AuthLocalDataSource>();
  bool pushNotifications = true;
  bool emailOffers = false;
  UserModel? user;
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final cachedUser = await authLocalDataSource.getUser();
      setState(() => user = cachedUser);
    } catch (_) {
      // No cached user setState(() => user = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          'Profile & Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          UserProfileHeader(
            userName: user?.fullName ?? 'Guest User',
            userEmail: user?.email ?? 'guest@example.com',
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: "ACCOUNT"),
          const SizedBox(height: 8),
          const AccountSection(),
          const SizedBox(height: 24),
          const SectionTitle(title: "PREFERENCES"),
          const SizedBox(height: 8),
          PreferencesSection(
            pushNotifications: pushNotifications,
            emailOffers: emailOffers,
            onPushChanged: (val) {
              setState(() => pushNotifications = val);
            },
            onEmailChanged: (val) {
              setState(() => emailOffers = val);
            },
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: "SUPPORT & LEGAL"),
          const SizedBox(height: 8),
          const SupportSection(),
          const SizedBox(height: 24),
          const LogoutButton(),
        ],
      ),
    );
  }
}
