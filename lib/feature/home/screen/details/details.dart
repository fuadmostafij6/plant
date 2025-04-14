

import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/constants/app_constant/app_constants.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart';
import 'package:plant/core/core.dart';
import 'package:plant/feature/home/widget/carbon/carbon.dart';
import 'package:plant/feature/home/widget/chart.dart';
class DetailsArg {

  DetailsArg({
    required this.title,
    required this.status,
});

  final String title;
  final String status;

}

class Details extends StatelessWidget {
  final DetailsArg detailsArg;
  const Details({super.key, required this.detailsArg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional(0.0, -1.0), // approximated angle 191.81deg
          end: AlignmentDirectional(0.0, 1.0),
          colors: [
            Color(0xFFFCFFFD),
            Color(0xFFFAFFFD),
            Color(0xFFF8FFFB),
          ],
          stops: [0.0, 0.58, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(PngIcon.home, height: 28.w,width: 28.w,),
              10.horizontalSpace,
              AppTexts.text(text: detailsArg.title, fontSize: Dimensions.headlineSmallSize, fontWeight: FontWeight.w300),
            ],
          ),
          leading: IconButton(
            icon: const Icon(PhosphorIconsRegular.caretLeft),
            onPressed: () {
              context.pop();
            },
          ),
          actions: [
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
              child: AppTexts.text(text:detailsArg.status, fontSize: Dimensions.labelMediumSize, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            16.horizontalSpace,
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Carbon(),
                      Column(
                        children: [
                          Icon(PhosphorIconsFill.caretDown, size: Dimensions.radius15, color: AppColors.primary),
                          Row(
                            children: [
                              bar(AppColors.purple),
                              4.horizontalSpace,
                              bar(AppColors.redAccent),
                              4.horizontalSpace,
                              bar(AppColors.greenAccent),
                              4.horizontalSpace,
                              bar(AppColors.yellowAccent),
                              4.horizontalSpace,
                              bar(AppColors.orangeAccent),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTexts.text(text: "History",
                          color: AppColors.lightFontColor,
                          fontSize: Dimensions.titleSmallSize, fontWeight: FontWeight.w400),

                      Row(
                        children: [
                          AppTexts.text(text: "See all",
                              color: AppColors.lightFontColor,
                              fontSize: Dimensions.bodyMediumSize, fontWeight: FontWeight.w400),
                          2.horizontalSpace,
                          Icon(PhosphorIconsFill.caretRight, size: Dimensions.radius12, color: AppColors.lightFontColor),
                        ],
                      )


                    ],
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 250.h,
                    width: double.infinity,


                      child: Chart()),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PersonsCard(),
                      RoomCard(),
                    ],
                  ),
                  16.verticalSpace,
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side with Plants label and icon
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             AppTexts.text(text: "Plants", fontWeight: FontWeight.w700,
                             color: AppColors.primary,
                              fontSize: Dimensions.headlineSmallSize),
                              8.verticalSpace,
                              Image.asset(PngIcon.leaf, width: 55.w, height: 55.w,)

                            ],
                          ),
                        ),

                        // Right side with number in green box
                    Container(
                      height: 150.h,
                      width: context.screenWidth/2 - 20.w,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFA1FFD0),
                            Color(0xFF6ABC93),
                          ],
                          stops: [0.0, 0.9803],
                          transform: GradientRotation(2.447), // 230.29deg converted to radians
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Spacer(),

                          AppTexts.text(text: "43",
                            color: AppColors.white,
                            fontSize: Dimensions.fontSize80, fontWeight: FontWeight.w700,),
                          Spacer(),

                        ],
                      ),
                    )
                      ],
                    ),
                  ),

                  32.verticalSpace

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bar(Color color) {

    return  Container(
      width: 24.w,
      height: 7.h,
      decoration: BoxDecoration(
        color: color,
      ),
    );

  }
}


class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: context.screenWidth/2 - 20.w,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFA1FFD0),
            Color(0xFF6ABC93),
          ],
          stops: [0.0, 0.9803],
          transform: GradientRotation(2.447), // 230.29deg converted to radians
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          AppTexts.text(text: "Room", fontWeight: FontWeight.w700,
              color: AppColors.white,
              fontSize: Dimensions.headlineSmallSize),
          Spacer(),

         AppTexts.text(text: "5",
           color: AppColors.white,
           fontSize: Dimensions.fontSize48, fontWeight: FontWeight.w700,),
          Spacer(),
          Container(
            padding: REdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              color: AppColors.white,
              
            ),
            child: AppTexts.text(text: "2 of them requires action", color: AppColors.primary,
            fontWeight: FontWeight.w500,
              fontSize:Dimensions.fontSize10
            ),
          ),
         
          Spacer()
        ],
      ),
    );
  }
}



class PersonsCard extends StatelessWidget {



  const PersonsCard({
    super.key,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: context.screenWidth/2 - 20.w,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          AppTexts.text(text: "Persons", fontWeight: FontWeight.w700, fontSize: Dimensions.headlineSmallSize),
         Spacer(),

          AnimatedAvatarStack(
              height: 50,
              width: 120,
              settings: RestrictedPositions(
                // maxCoverage: -0.1,
                // minCoverage: -0.5,
                maxCoverage:0.7,
                align: StackAlign.right,
              ),
              avatars: [
                for (var n = 0; n < 6; n++) NetworkImage('https://i.pravatar.cc/150?img=$n'),
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
          Spacer()
        ],
      ),
    );
  }
}

