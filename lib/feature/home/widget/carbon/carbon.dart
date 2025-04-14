

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/core.dart';
class Carbon extends StatelessWidget {
  final String title;
  final String percent;
  const Carbon({super.key,  this.title="652",  this.percent ='13'});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTexts.text(text: title, fontWeight: FontWeight.w300, fontSize:Dimensions.fontSize48, color: AppColors.primary ),

        8.horizontalSpace,
        Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Row(
                  children: [
                    Icon(PhosphorIconsFill.caretDown, size: Dimensions.radius10, color: AppColors.white),
                    AppTexts.text(text: "$percent%",
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.labelMediumSize, color: AppColors.white),
                  ],
                )
            ),
            AppTexts.text(text: "ppm",
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.labelMediumSize, color: AppColors.primary)
          ],
        ),

      ],
    );
  }
}
