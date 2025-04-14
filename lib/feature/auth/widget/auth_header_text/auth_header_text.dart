


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant/core/constants/app_constant/size/dimensions.dart';
import 'package:plant/core/constants/app_constant/widget/app_text/app_text.dart';
class AuthHeaderText extends StatelessWidget {
  const AuthHeaderText({
    super.key,
     this.show=true,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.text(text: title, fontSize: Dimensions.fontSize30, fontWeight: FontWeight.w500),
        8.verticalSpace,
        if(show)
        AppTexts.text(text: subtitle, fontSize: Dimensions.bodyMediumSize, fontWeight: FontWeight.w500),

      ],
    );
  }
}