import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerSkeleton extends StatelessWidget {
  final double height;
  final double borderRadius;

  const BannerSkeleton({super.key, this.height = 160, this.borderRadius = 12});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
