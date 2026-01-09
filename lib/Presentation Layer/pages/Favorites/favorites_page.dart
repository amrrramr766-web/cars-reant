import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/widget/favorite_car_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FaveCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF101922)
          : const Color(0xFFF5F7F8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<FaveCubit, FaveState>(
                builder: (context, state) {
                  if (state is FaveLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: isDark ? Colors.white : const Color(0xFF7C3AED),
                      ),
                    );
                  }

                  if (state is FaveError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is FaveCarsLoaded) {
                    final favorites = state.faveCars;

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        return FavoriteCarCard(
                          car: favorites[index],
                          isDark: isDark,
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
