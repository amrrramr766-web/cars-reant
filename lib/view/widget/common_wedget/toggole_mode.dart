import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/controller/theme/cubit/theme_cubit.dart';

class ToggoleMode extends StatelessWidget {
  const ToggoleMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        final isDark = mode == ThemeMode.dark;

        return SwitchListTile(
          value: isDark,
          onChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
          title: const Text("Dark Mode"),
          secondary: const Icon(Icons.dark_mode),
        );
      },
    );
  }
}
