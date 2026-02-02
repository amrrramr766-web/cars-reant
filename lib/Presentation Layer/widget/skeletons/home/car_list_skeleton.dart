import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarListSkeleton extends StatelessWidget {
  final int itemCount;

  const CarListSkeleton({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _CarSkeletonItem();
      },
    );
  }
}

class _CarSkeletonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Car image placeholder
            Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 12),

            // Text placeholders
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _line(width: double.infinity),
                  const SizedBox(height: 8),
                  _line(width: 140),
                  const Spacer(),
                  _line(width: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _line({required double width}) {
    return Container(
      height: 14,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
