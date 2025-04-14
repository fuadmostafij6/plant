
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart';
import 'package:plant/core/core.dart';
import 'package:plant/feature/auth/bloc/auth/auth_bloc.dart';
import 'package:plant/feature/auth/widget/auth_header_text/auth_header_text.dart';
class SignUp extends StatelessWidget {

  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body:  SafeArea(
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
                if (state is AuthRegistrationSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Registration Successful")),
                  );


                  context.go(AppRoutes.HOME);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  AuthHeaderText(title: "Sign Up",subtitle: "Let’s save environment together",),
                  35.verticalSpace,

                  // Spacer(flex: 2,),
                  AppTextField.textFiled(context,
                    controller: nameController,
                    title: "Name", hintText: "e.g: Ahmed Ariyan",),
                  12.verticalSpace,
                  AppTextField.phoneTextFiled(context,
                    controller: phoneController,
                    title: "Phone Number", hintText: "17XXXXXXXX",),
                  12.verticalSpace,
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
                  AppTextField.textFiled(context,
                    obscureText: true,
                    suffixIcon: Icon(PhosphorIconsRegular.eyeClosed),
                    title: "Confirm Password", hintText: "********",),
                  24.verticalSpace,







                  Row(

                    children: [
                      Expanded(child:

                      BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {

                          return AppButton.filledButton(load: state is AuthLoading?true:false, text: "Sign In",
                              onPressed: (){
                                context.read<AuthBloc>().add(RegisterEvent(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(), name: nameController.text.trim(), phone: phoneController.text.trim(),
                                ));
                              }
                          );
                        }
                      ))
                    ],
                  ),
                  12.verticalSpace,
                  // Spacer(flex: 1,),
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
                 12.verticalSpace,
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Don’t have an account? ',
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: Dimensions.bodySmallSize,
                                  color: AppColors.lightFontColor)),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(fontWeight: FontWeight.w700,
                                fontSize: Dimensions.bodyMediumSize,
                                color: AppColors.primary),
                            recognizer: TapGestureRecognizer()..onTap = () => context.pop(),
                          ),

                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,
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
