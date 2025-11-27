import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget faveButton({
  required int userId,
  required int carId,
  required bool isFavorited,
}) {
  return BlocBuilder<FaveCubit, FaveState>(
    builder: (context, state) {
      final bool isLoading =
          state is AddFaveLoading || state is RemoveFaveLoading;

      return Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 3),
        child: Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
            color: AppColors.deepPurpleAccent400,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.transparent),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? AppColors.red : AppColors.white,
                    size: 20,
                  ),
            onPressed: isLoading
                ? null
                : () {
                    final cubit = context.read<FaveCubit>();

                    if (isFavorited) {
                      //    cubit.removeFave(userId, carId);
                    } else {
                      cubit.addFave(userId, carId);
                    }
                  },
          ),
        ),
      );
    },
  );
}
