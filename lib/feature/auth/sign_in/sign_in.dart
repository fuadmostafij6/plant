


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/constants/app_constant/app_constants.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart';
import 'package:plant/core/constants/app_constant/app_icon/svg.dart';
import 'package:plant/core/routes/app_routes.dart';
import 'package:plant/feature/auth/bloc/auth/auth_bloc.dart';
import 'package:plant/feature/auth/widget/auth_header_text/auth_header_text.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {

                if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
                if (state is AuthAuthenticated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Successful")),
                  );


                  context.go(AppRoutes.HOME);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  AuthHeaderText(title: "Sign In",subtitle: "Let’s save environment together",),
                 32.verticalSpace,
                  AppTextField.textFiled(context,
                    controller: emailController,
                    title: "Email", hintText: "user@example.com",),
                  12.verticalSpace,
                  AppTextField.textFiled(context,
                    controller: passwordController,
                    obscureText: true,
                    suffixIcon: Icon(PhosphorIconsRegular.eyeClosed),
                    title: "Password", hintText: "********",),
                  12.verticalSpace,


                  Row(
                    children: [
                      Expanded(

                        child: CheckboxListTile(

                          title: Transform.translate(
                              offset: const Offset(-15, 0),
                              child:  Text("Remember me", style: TextStyle(color: AppColors.gray400,fontSize: Dimensions.bodyMediumSize, fontWeight: FontWeight.w400),)),


                          side:  BorderSide(color: AppColors.primary),
                          activeColor:AppColors.primary,
                          contentPadding: REdgeInsets.all(0),
                          value: true,
                          onChanged: (newValue) {

                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ),

                      TextButton(
                        onPressed: () {

                          context.go("${AppRoutes.SIGN_IN}${AppRoutes.SEND_OTP}");

                        },
                        child:  AppTexts.text(text:"Forgotten Password", color: AppColors.primary, fontWeight: FontWeight.w700,fontSize: Dimensions.bodyMediumSize, ),
                      ),
                    ],
                  ),
                  12.verticalSpace,




                  Row(

                    children: [
                      Expanded(child:
                      BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                          return AppButton.filledButton(load: state is AuthLoading?true:false, text: "Sign In",
                          onPressed: (){
                            context.read<AuthBloc>().add(LoginEvent(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ));

                          }
                          );
                        }
                      ))
                    ],
                  ),
                 12.verticalSpace,
                  Center(child: AppTexts.text(text: "Or Sign In with", color: AppColors.lightFontColor, fontSize: Dimensions.bodyMediumSize, fontWeight: FontWeight.w500)),
                  24.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(PngIcon.google,height: 42.h,width: 42.h,),
                      8.horizontalSpace,
                      Image.asset(PngIcon.facebook, height: 42.h,width: 42.h,),
                      8.horizontalSpace,
                      Image.asset(PngIcon.microsoft, height: 42.h,width: 42.h,),
                      8.horizontalSpace,
                      Image.asset(PngIcon.apple, height: 42.h,width: 42.h,),
                    ],
                  ),
                  80.verticalSpace,
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Don’t have an account? ',
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: Dimensions.bodySmallSize,
                                  color: AppColors.lightFontColor)),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.w700,
                                fontSize: Dimensions.bodyMediumSize,
                                color: AppColors.primary),
                            recognizer: TapGestureRecognizer()..onTap = () => context.go("${AppRoutes.SIGN_IN}${AppRoutes.SIGN_UP}"),
                          ),

                        ],
                      ),
                    ),
                  ),
                  32.verticalSpace,
                  Center(child: PoweredBy.poweredBy()),
                  20.verticalSpace

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
