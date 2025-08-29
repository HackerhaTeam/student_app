import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDetilesItem extends StatelessWidget {
  final double width;
  final double borderRadius;
  
  const ShimmerDetilesItem({
    super.key,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16 * MediaQuery.of(context).size.width / 375), // Assuming 375 is base width
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IconText shimmer
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 16 * MediaQuery.of(context).size.width / 375,
                  height: 16 * MediaQuery.of(context).size.width / 375,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: 8 * MediaQuery.of(context).size.width / 375),
                Container(
                  width: 80 * MediaQuery.of(context).size.width / 375,
                  height: 16 * MediaQuery.of(context).size.width / 375,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8 * MediaQuery.of(context).size.width / 375),
            // Spacer
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.transparent,
            ),
            // Value text shimmer
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                width: 100 * MediaQuery.of(context).size.width / 375,
                height: 24 * MediaQuery.of(context).size.width / 375,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}