import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/shimmer_detiles_item.dart';

class ShimmerDetilesSection extends StatelessWidget {
  const ShimmerDetilesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.w(context),
            runSpacing: 8.w(context),
            children: [
              ShimmerDetilesItem( width: 182.w(context), borderRadius: 12.w(context),),
              ShimmerDetilesItem( width: 182.w(context), borderRadius: 12.w(context),),
              ShimmerDetilesItem( width: 182.w(context), borderRadius: 12.w(context),),
              ShimmerDetilesItem( width: 182.w(context), borderRadius: 12.w(context),),
              
              SizedBox(height: 16),
              
            ],
          ),
        ],
      ),
    );
  }
}