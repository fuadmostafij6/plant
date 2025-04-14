
import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/core.dart';
import 'package:plant/feature/home/screen/details/details.dart';

import 'package:plant/feature/home/widget/carbon/carbon.dart' show Carbon;
class PlacesCard extends StatelessWidget {
  final String title;
  final String status;
  const PlacesCard({super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.go("${AppRoutes.HOME}${AppRoutes.DETAIL}",
            extra: DetailsArg(title: title, status: status)
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTexts.text(text: title, fontSize: Dimensions.titleSmallSize, fontWeight: FontWeight.w500),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF42D58B),
                        Color(0xFF65D49C),
                        Color(0xFF47BA80),
                        Color(0xFF2DF28F),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AppTexts.text(text:status, fontSize: Dimensions.labelMediumSize, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Carbon(),
                AnimatedAvatarStack(
                    height: 50,
                    width: 150,
                    settings: RestrictedPositions(
                      // maxCoverage: -0.1,
                      // minCoverage: -0.5,
                      maxCoverage:0.5,
                      align: StackAlign.right,
                    ),
                    avatars: [
                      for (var n = 0; n < 10; n++) NetworkImage('https://i.pravatar.cc/150?img=$n'),
                    ],
                    infoWidgetBuilder: (int index, context) => Container(
                      height: 50,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColors.lightFontColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 2, )
                      ),
                      child: Center(child: AppTexts.text(text: "+$index", fontSize: Dimensions.bodyLargeSize,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700)),

                    )),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTexts.text(text: "View details", fontWeight: FontWeight.w500, fontSize: Dimensions.bodySmallSize, color: AppColors.primary),
                Icon(PhosphorIconsFill.caretRight, size: 16, color: AppColors.primary)
              ],
            ),
            SizedBox(height: 16),
            // SizedBox(
            //     height: 200,
            //     child: Chart())



          ],
        ),
      ),
    );
  }
}