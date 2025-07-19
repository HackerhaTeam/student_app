import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class CourseShimmer extends StatelessWidget {
  const CourseShimmer({
    super.key,
     this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:Theme.of(context).extension<AppBackgrounds>()!.shemmerBg ,
      highlightColor: Colors.white,
      child: CustomCard(
       
    
     
      child: Container( height: 294,
      decoration: BoxDecoration(color: Colors.white,   borderRadius:BorderRadius.circular(21.r(context)),),
        width:width ?? MediaQuery.of(context).size.width * 0.75,)
      ),
    );
  }
}


  // 