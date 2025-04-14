
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/feature/auth/widget/auth_header_text/auth_header_text.dart' show AuthHeaderText;

import 'package:plant/core/core.dart';
class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              AuthHeaderText(title: "Reset Password",subtitle: "Recover your account in easy steps",show: false,),
              Spacer(),

              AppTextField.textFiled(context, title: "New Password",
                obscureText: true,
                suffixIcon: Icon(PhosphorIconsRegular.eyeClosed),

                hintText: "********",),
              12.verticalSpace,
              AppTextField.textFiled(context,
                obscureText: true,
                suffixIcon: Icon(PhosphorIconsRegular.eyeClosed),
                title: "Confirm Password", hintText: "********",),
              Spacer(),




              Row(

                children: [
                  Expanded(child: AppButton.filledButton(load: false, text: "Reset Password",
                      onPressed: (){
                        context.go(AppRoutes.SIGN_IN);
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
