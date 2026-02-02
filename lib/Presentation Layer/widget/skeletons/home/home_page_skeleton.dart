import 'package:car_rent/Presentation%20Layer/widget/skeletons/home/banner_skeleton.dart';
import 'package:car_rent/Presentation%20Layer/widget/skeletons/home/car_list_skeleton.dart';
import 'package:flutter/material.dart';

class HomePageSkeletonSliver extends StatelessWidget {
  const HomePageSkeletonSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
          BannerSkeleton(),
          SizedBox(height: 145),
          CarListSkeleton(itemCount: 3),
        ],
      ),
    );
  }
}
