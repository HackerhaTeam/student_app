import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_button.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class TeachersSection extends StatelessWidget {
  const TeachersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("المدرسين", style: context.xHeadingLarge),
        const SizedBox(height: 16),
        const _TeacherCard(),
      ],
    );
  }
}

class _TeacherCard extends StatelessWidget {
  const _TeacherCard();

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;

    return CustomCard(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      backgroundColor:background.onSurfacePrimary,
      borderColor:  border.transparent,
      borderRadius: 12.w(context),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TeacherHeader(),
          SizedBox(height: 8),
          Divider(color:border.transparent,),
          SizedBox(height: 16),
          _TeacherDescription(),
          SizedBox(height: 20),
          _TeacherStats(),
        ],
      ),
    );
  }
}

class _TeacherHeader extends StatelessWidget {
  const _TeacherHeader();

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Row(
        children: [
          CustomCard(
            width: 50.w(context),
            height: 50.w(context),
            
            child:ClipRRect(
              borderRadius: BorderRadius.circular(12.w(context)),
              child: Image(image:NetworkImage("https://static.photofeeler.com/images/home/test-box/01.jpg") )) ,
          
          ),
          SizedBox(width: 12.w(context)),
          const Text("أ. محمد المحمد"),
          const Spacer(),
          CustomButton(
            onPressed: () {},
            height: 38,
            width: 87.w(context),
            color: background.secondaryBrand,
            borderRadius: 12.w(context),
            child: Text(
              "عرض المزيد",
              style: context.xLabelSmall.copyWith(color: content.primaryInverted),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeacherDescription extends StatelessWidget {
  const _TeacherDescription();

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("حول المدرس", style: context.xHeadingSmall),
          const SizedBox(height: 8),
          Text(
            "طالب في السنة الرابعة من تخصص المعلوماتية، لدي شغف كبير في التدريس، حيث أسعى دائماً لتبسيط المفاهيم المعقدة وجعلها سهلة الفهم للطلاب. أستخدم أساليب تعليمية مبتكرة، وأشجع على التفكير النقدي وحل المشكلات، مما يساعد الطلاب على تطوير مهاراتهم الفكرية بشكل فعال.",
            style: context.xParagraphMedium.copyWith(color: content.secondary),
          ),
        ],
      ),
    );
  }
}

class _TeacherStats extends StatelessWidget {
  const _TeacherStats();
  Widget _statColumn(String value, String label,BuildContext context) {
final content = Theme.of(context).extension<AppContent>()!;
    return Column(
      children: [
        Text(value,style: context.xDisplaySmall,),
        Text(label,style: context.xLabelMedium.copyWith(color:content.secondary ),),
      ],
    );
  }

  Widget _verticalDivider(BuildContext context) {
    final border = Theme.of(context).extension<AppBorders>()!;
    return Container(
      height: 25,
      width: 1.w(context),
      color: border.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w(context)),
      child: Row(
        children: [
          _statColumn("9528", "طالب",context),
          SizedBox(width: 20.w(context)),
          _verticalDivider(context),
          SizedBox(width: 20.w(context)),
          _statColumn("10", "دورات",context),
          SizedBox(width: 20.w(context)),
          _verticalDivider(context),
          SizedBox(width: 20.w(context)),
          _statColumn("4.7", "التقييم",context),
          SizedBox(width: 20.w(context)),
          _verticalDivider(context),
          SizedBox(width: 20.w(context)),
          _statColumn("888", "مراجعة",context),
        ],
      ),
    );
  }
}
