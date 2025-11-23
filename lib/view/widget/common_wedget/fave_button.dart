import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget faveButton({
  required int userId,
  required int carId,
  required bool isFavorited,
}) {
  return BlocBuilder<FaveCubit, FaveState>(
    builder: (context, state) {
      final bool isLoading = state is AddFaveLoading;

      return IconButton(
        icon: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited ? Colors.red : Colors.white,
              ),
        onPressed: isLoading
            ? null
            : () {
                TODO: //'removeFave'

                context.read<FaveCubit>().addFave(userId, carId);
                isFavorited = !isFavorited;
              },
      );
    },
  );
}
