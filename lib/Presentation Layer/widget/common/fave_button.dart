import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rent/server_locator.dart';

Widget faveButton({
  required int carId,
  required bool isDark,
  required bool isFavorited,
}) {
  return BlocProvider(
    create: (context) => sl<FaveCubit>(),
    child: BlocSelector<FaveCubit, FaveState, bool>(
      selector: (state) {
        if (state is FaveCarsLoaded) {
          return state.faveCars.any((car) => car.id == carId);
        }
        return isFavorited;
      },
      builder: (context, isFavorited) {
        return Padding(
          padding: EdgeInsets.only(left: 8.w, top: 3.h), // responsive padding
          child: CircleAvatar(
            radius: 16.r, // responsive radius
            backgroundColor: isDark ? Colors.black12 : Colors.grey[300],
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                context.read<FaveCubit>().toggleFave(carId);
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, anim) =>
                    ScaleTransition(scale: anim, child: child),
                child: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(isFavorited),
                  color: isFavorited ? AppColors.red : AppColors.white,
                  size: 20.sp, // responsive size
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
