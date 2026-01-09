import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarGridSkeleton extends StatelessWidget {
  final int itemCount;

  const CarGridSkeleton({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    // استخدم SizedBox مع GridView داخل ScrollView لكي يكون RenderBox
    return SizedBox(
      height: 500.h, // ارتفاع تقريبي للعرض في PagedSliverGrid
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // منع التمرير داخل المؤشر
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 3 / 4.5,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8.r),
            ),
          );
        },
      ),
    );
  }
}
