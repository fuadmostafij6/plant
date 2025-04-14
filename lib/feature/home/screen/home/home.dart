
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart'
    show PngIcon;
import 'package:plant/core/core.dart';
import 'package:plant/feature/auth/bloc/user/user_bloc.dart';
import 'package:plant/feature/auth/services/auth_services.dart';

import 'package:plant/feature/home/widget/place_card/place_card.dart'
    show PlacesCard;
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional(
            0.0,
            -1.0,
          ), // approximated angle 191.81deg
          end: AlignmentDirectional(0.0, 1.0),
          colors: [Color(0xFFFCFFFD), Color(0xFFFAFFFD), Color(0xFFF8FFFB)],
          stops: [0.0, 0.58, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: Icon(PhosphorIconsRegular.plus, color: AppColors.white),
          onPressed: () {
            context.go("${AppRoutes.HOME}${AppRoutes.Add_SCREEN}");
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(PngIcon.homeHeader),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    context.statusBarHeight.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTexts.text(
                              text: "Good Morning",
                              fontWeight: FontWeight.w400,
                              fontSize: Dimensions.bodyLargeSize,
                            ),
                            8.verticalSpace,
                            if( FirebaseAuth.instance.currentUser !=null)
                            BlocProvider(
                              create:
                                  (_) => UserBloc(AuthServices())..add(
                                    GetUserByUid(
                                      FirebaseAuth.instance.currentUser!.uid,
                                    ),
                                  ),
                              child: BlocBuilder<UserBloc, UserState>(
                                builder: (context, state) {
                                  if (state is UserLoading) {
                                    return Skeletonizer(
                                      child: AppTexts.text(
                                        text: "User",
                                        fontWeight: FontWeight.w500,
                                        fontSize: Dimensions.headlineSmallSize,
                                      ),
                                    );
                                  } else if (state is UserLoaded) {

                                    return AppTexts.text(
                                      text: state.user.name,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimensions.headlineSmallSize,
                                    );
                                  } else if (state is UserError) {
                                    return AppTexts.text(
                                      text: "Error: ${state.message}",
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimensions.headlineSmallSize,
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            ),

                            30.verticalSpace,
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'You are in a ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: Dimensions.labelLargeSize,
                                      color: AppColors.lightFontColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'healthy ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.labelLargeSize,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'environment',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: Dimensions.labelLargeSize,
                                      color: AppColors.lightFontColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            FirebaseAuth.instance.signOut();
                            context.go(AppRoutes.SPLASH);
                          },
                          child: Image.asset(
                            PngIcon.user,
                            width: 98.w,
                            height: 98.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            24.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTexts.text(
                    text: "My Places",
                    fontSize: Dimensions.bodyLargeSize,
                    fontWeight: FontWeight.w300,
                  ),
                  16.verticalSpace,
                  PlacesCard(title: 'Home', status: 'Good'),
                  16.verticalSpace,
                  PlacesCard(title: 'Office', status: 'Healthy'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
