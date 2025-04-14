

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widget/auth_header_text/auth_header_text.dart';
import 'package:plant/core/core.dart';
class SendOtp extends StatelessWidget {
  const SendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              AuthHeaderText(title: "Send OTP",subtitle: "Recover your account in easy steps",),
              Spacer(),
              AppTextField.textFiled(context,
                controller: emailController,
                title: "Email", hintText: "user@example.com",),

             Spacer(),




              Row(

                children: [
                  Expanded(child: AppButton.filledButton(load: false, text: "Send Otp",
                      onPressed: (){
                        context.go("${AppRoutes.SIGN_IN}${AppRoutes.SEND_OTP}${AppRoutes.VERIFY_OTP}",extra:emailController.text.trim() );
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
