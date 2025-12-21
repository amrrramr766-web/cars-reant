import 'package:car_rent/Presentation%20Layer/pages/user/cubit/user_cubit.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/title_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/personalDetail/widget/contact_info_section.dart';
import 'package:car_rent/Presentation%20Layer/pages/user/personalDetail/widget/driver_license_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _countryController = TextEditingController(text: "California, USA");
  DateTime? _expiryDate;

  @override
  void initState() {
    super.initState();
    // Run after the widget tree is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().fetchUser();
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _licenseNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          final user = state.user;
          _fullNameController.text = user.fullName;
          _emailController.text = user.email;
          _phoneController.text = user.phone;
          _licenseNumberController.text = user.license?.licenseNumber ?? '';
          _countryController.text = user.license?.address ?? '';

          _expiryDate = user.license?.expiryDate;
        }
      },
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is UserError) {
            return Scaffold(body: Center(child: Text(state.message)));
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Personal Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SectionTitle(title: 'Contact Information'),
                const SizedBox(height: 12),
                ContactInfoSection(
                  fullNameController: _fullNameController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                ),
                const SizedBox(height: 24),

                const SectionTitle(title: "Driver's License"),
                const SizedBox(height: 12),
                DriverLicenseSection(
                  licenseNumberController: _licenseNumberController,
                  countryController: _countryController,
                  expiryDate: _expiryDate,

                  onDatePicked: (date) {
                    setState(() => _expiryDate = date);
                  },
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Changes Saved Successfully')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF005A9C),
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFffffff),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
