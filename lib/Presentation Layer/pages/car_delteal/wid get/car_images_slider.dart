import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/Presentation%20Layer/pages/Favorites/cubit/cubit/fave_cubit.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/fave_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarImagesSlider extends StatelessWidget {
  final CarEntity car;
  final bool isDark;
  const CarImagesSlider({super.key, required this.car, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      car.imageUrl,
      car.imageUrl,
      car.imageUrl,
    ].whereType<String>().where((url) => url.isNotEmpty).toList();

    // If no valid images, use a placeholder
    if (images.isEmpty) {
      images.add('https://via.placeholder.com/400x300?text=No+Image');
    }

    return BlocListener<FaveCubit, FaveState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: SliverAppBar(
        expandedHeight: 280.h,
        floating: false,
        pinned: true,
        backgroundColor: AppColors.deepPurple,
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          faveButton(
            carId: car.id,
            isDark: isDark,
            isFavorited: car.isFavorite,
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: images[index],
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(
                    Icons.directions_car,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
