

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:plant/core/core.dart';
import 'package:plant/packages/auto_size_textField/auto_sized_textField.dart';
class AppTextField{
  AppTextField._();

  static Widget textFiled(
      BuildContext context, {
        ValueChanged<String?>? onChanged,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        FocusNode? focusNode,
        Widget? suffixIcon,
        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        IconData? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,

        inputFormatters: inputFormatters,
        focusNode: focusNode,

        onTapOutside: (event){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
        obscureText: obscureText,
        maxLines: maxLine,
        enabled: enabled,
        onChanged: onChanged,

        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.zero,
          suffixIcon: suffixIcon,

          hintText: hintText ?? title,
          helperText: helperText,
          hintStyle: TextStyle(
            color: AppColors.lightFontColor,
            fontSize: Dimensions.bodyLargeSize,
            fontWeight: FontWeight.w400,

          ),

          labelText: title,


          labelStyle: TextStyle(
              fontSize: Dimensions.bodySmallSize,
              color: AppColors.black,
            fontWeight: FontWeight.w500
          ),

          //    labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.always,


          enabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray200),
          ),
          disabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray200),
          ),
          focusedBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray600),
          ),
          errorBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray400),
          ),
          focusedErrorBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray400),
          ),
        ),
      );

  static Widget phoneTextFiled(
      BuildContext context, {
        ValueChanged<PhoneNumber?>? onChanged,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        FocusNode? focusNode,
        Widget? suffixIcon,
        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        IconData? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      IntlPhoneField(

        controller: controller,

        inputFormatters: inputFormatters,
        focusNode: focusNode,


        style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
        obscureText: obscureText,
        enabled: enabled,
        onChanged: onChanged,
        initialCountryCode: 'BD',
        showDropdownIcon: false,

        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),

          gradient: RadialGradient(
            // Center of the gradient converted from CSS percentages.
            center: Alignment(1.57, -0.35),
        // The "radius" in Flutter defines the radius of the circle in logical pixels
        // relative to the shortest side of the box. In this basic example,
        // we simply set it to 1.0.
        radius: 1.0,
        // The list of colors exactly from the CSS stops.
        colors: [
          Color(0xFFF1F1F1),
          Color(0xFFFFFFFF),
          Color(0xFFF6F1F1),
        ],
        // The stops map directly to the color stops (0.0, 0.5151, and 1.0).
        stops: [0.0, 0.5151, 1.0],
      ),
        ),
        dropdownTextStyle: TextStyle(
          fontSize: Dimensions.bodyLargeSize,
          color: AppColors.lightFontColor,
          fontWeight: FontWeight.w400
        ),

        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.zero,

          hintText: hintText ?? title,
          helperText: helperText,
          hintStyle: TextStyle(
            color: AppColors.lightFontColor,
            fontSize: Dimensions.bodyLargeSize,
            fontWeight: FontWeight.w400,

          ),

          labelText: title,


          labelStyle: TextStyle(
              fontSize: Dimensions.bodySmallSize,
              color: AppColors.black,
              fontWeight: FontWeight.w500
          ),

          //    labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.always,


          enabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray200),
          ),
          disabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray200),
          ),
          focusedBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray600),
          ),
          errorBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray400),
          ),
          focusedErrorBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray400),
          ),
        ),
      );


  static Widget autoSizedTextFiled(
      BuildContext context, {
        ValueChanged<String?>? onChanged,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        FocusNode? focusNode,
        Widget? suffixIcon,
        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        IconData? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      AutoSizeTextFormField(

        controller: controller,


        inputFormatters: inputFormatters,
        focusNode: focusNode,
        fullwidth: false,
        minWidth: 64.w,
        maxLines: maxLine,

        minFontSize: Dimensions.bodyLargeSize,
        stepGranularity: Dimensions.bodyLargeSize,
        style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
        obscureText: obscureText,
        enabled: enabled,
        onChanged: onChanged,


        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.zero,

          hintText: hintText ?? title,
          helperText: helperText,
          hintStyle: TextStyle(
            color: AppColors.lightFontColor,
            fontSize: Dimensions.bodyLargeSize,
            fontWeight: FontWeight.w400,

          ),

          labelText: title,


          labelStyle: TextStyle(
              fontSize: Dimensions.bodySmallSize,
              color: AppColors.black,
              fontWeight: FontWeight.w500
          ),

          //    labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.always,


          enabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray200),
          ),
          disabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray200),
          ),
          focusedBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray600),
          ),
          errorBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray400),
          ),
          focusedErrorBorder: UnderlineInputBorder(

            borderSide: BorderSide(color: AppColors.gray400),
          ),
        ),
      );
  static Widget textFiled1(
      BuildContext context, {
        ValueChanged<String?>? onChanged,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        FocusNode? focusNode,
        Widget? suffixIcon,
        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        IconData? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,

        inputFormatters: inputFormatters,
        focusNode: focusNode,

        onTapOutside: (event){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
        obscureText: obscureText,
        maxLines: maxLine,
        enabled: enabled,
        onChanged: onChanged,
        // onTap: onTapSuffixIcon,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: prefixIcon == null ? false : true,
          hintText: hintText ?? title,
          helperText: helperText,

          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: AppColors.gray400,
            fontSize: Dimensions.titleSmallSize,
            fontWeight: FontWeight.w400,

          ),
          labelText: title,


          labelStyle: TextStyle(
              fontSize: Dimensions.bodyLargeSize,
              color: AppColors.gray600
          ),

          //    labelText: title,

          floatingLabelBehavior: FloatingLabelBehavior.auto,


          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            borderSide: BorderSide(color: AppColors.gray200),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            borderSide: BorderSide(color: AppColors.gray200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray600),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray400),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            borderSide: BorderSide(color: AppColors.gray400),
          ),
        ),
      );


  static Widget searchField(
      BuildContext context, {
        ValueChanged<String?>? onChanged,
        ValueChanged<String?>? onSubmitted,

        bool obscureText = false,
        VoidCallback? onTapSuffixIcon,
        VoidCallback? onTap,
        FocusNode? focusNode,
        Widget? suffixIcon,
        Color?borderColor,
        TextInputAction? textInputAction,

        String? fontFamily,
        // List<RankModel> items= const[],

        TextInputType? keyboardType,
        bool enabled = true,
        String? Function(String?)? validator,
        VoidCallback? onTapPrefixIcon,
        Widget? prefixIcon,
        String? helperText,
        FontWeight? fontWeight,
        Color? textColor,
        List<TextInputFormatter>? inputFormatters,
        String ?title,
        String? hintText,
        TextEditingController? controller,
        int maxLine = 1,
        bool isPhone = false,  // New parameter to indicate if the field is for phone number
        bool rank = false,  // New parameter to indicate if the field is for phone number
      }) =>
      GestureDetector(

        onTap: !enabled?onTap:null,
        child: TextFormField(
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          onFieldSubmitted:onSubmitted,


          inputFormatters: inputFormatters,
          focusNode: focusNode,
          autofocus: true,

          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style:  TextStyle(fontWeight:fontWeight?? FontWeight.normal, color:textColor?? AppColors.gray900, fontSize: Dimensions.bodyLargeSize),
          obscureText: obscureText,
          maxLines: maxLine,
          enabled: enabled,
          onChanged: onChanged,
          onTap: onTap,
          // onTap: onTapSuffixIcon,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            isDense: false,
            //contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),


            hintText: hintText ?? title,
            helperText: helperText,
            prefixIcon: prefixIcon == null
                ? null
                : GestureDetector(
              onTap: onTapPrefixIcon,
              child: Padding(
                padding: REdgeInsets.all(8),
                child: prefixIcon,
              ),
            ),

            suffixIcon: suffixIcon == null
                ? null
                : Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: onTapSuffixIcon,
                child: suffixIcon,
              ),
            ),
            hintStyle: TextStyle(
              color: AppColors.gray400,
              fontSize: Dimensions.titleSmallSize,
              fontWeight: FontWeight.w400,

            ),
            labelText: title,


            labelStyle: TextStyle(
                fontSize: Dimensions.bodyLargeSize,
                color: AppColors.gray600
            ),

            //    labelText: title,

            floatingLabelBehavior: FloatingLabelBehavior.auto,


            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray200),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray600),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color:borderColor?? AppColors.gray400),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: borderColor??AppColors.gray400),
            ),
          ),
        ),
      );
}