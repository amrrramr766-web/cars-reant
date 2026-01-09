import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarFutcherSkeleton extends StatelessWidget {
  const CarFutcherSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(height: 200, width: double.infinity, color: Colors.grey),
    );
  }
}
