import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rent/controller/fave/cubit/fave_cubit.dart';
import 'package:car_rent/view/widget/common_wedget/fave_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rent/data/model/car_model.dart';

class CarImagesSlider extends StatelessWidget {
  final CarModel car;
  final int userId;
  const CarImagesSlider({super.key, required this.car, required this.userId});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [?car.imageUrl, ?car.imageUrl, ?car.imageUrl];

    return BlocListener<FaveCubit, FaveState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: SliverAppBar(
        expandedHeight: 280.h,
        floating: false,
        pinned: true,
        backgroundColor: Colors.deepPurple,
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [faveButton(userId: userId, carId: car.carID!,isFavorited: car.isFave??false)],
        flexibleSpace: FlexibleSpaceBar(
          background: PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) =>
                CachedNetworkImage(imageUrl: images[index], fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
