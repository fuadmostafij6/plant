
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:plant/core/core.dart';
import 'package:plant/feature/auth/widget/auth_header_text/auth_header_text.dart';
class VerifyOtp extends StatelessWidget {
  final String email;
  const VerifyOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    StreamController<ErrorAnimationType>? errorController;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              AuthHeaderText(title: "Verify OTP",subtitle: "Recover your account in easy steps",),
              Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'An email has been sent to ',
                        style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: Dimensions.bodyLargeSize,
                            color: AppColors.lightFontColor)),
                    TextSpan(
                      text: email,
                      style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: Dimensions.bodyLargeSize,
                          color: AppColors.black),
                    ),

                  ],
                ),
              ),
              AppTexts.text(text: "Please enter the sent OTP.",
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.bodyLargeSize,
                color: AppColors.lightFontColor,

              ),
              20.verticalSpace,
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: AppColors.gray600,
                  // fontWeight: FontWeight.bold,
                ),
                length: 4,
                obscureText: false,
                obscuringCharacter: '*',
                // obscuringWidget: const FlutterLogo(
                //   size: 24,
                // ),
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                // dialogConfig: DialogConfig(
                //     dialogTitle: 'Dialog Title',
                //     dialogContent: 'This is dialog content',
                //     affirmativeText: 'YES',
                //     negativeText: 'NO'),
                validator: (v) {
                  if (v!.length < 3) {
                    return null;
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 70,
                  fieldWidth: 60,

                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedBorderWidth: 1,
                  selectedColor: AppColors.gray600,

                  activeBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  errorBorderWidth: 1,
                  errorBorderColor:AppColors.error700,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.gray200,



                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (text) async {

                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {

                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              Spacer(),




              Row(

                children: [
                  Expanded(child: AppButton.filledButton(load: false, text: "Verify OTP",
                      onPressed: (){
                        context.go("${AppRoutes.SIGN_IN}${AppRoutes.SEND_OTP}${AppRoutes.RESET_PASS}");
                      }
                  ))
                ],
              ),
              Spacer(flex: 2,),
              Center(child: PoweredBy.poweredBy()),
              20.verticalSpace,


            ],
          ),
        ),
      ),
    );
  }
}
