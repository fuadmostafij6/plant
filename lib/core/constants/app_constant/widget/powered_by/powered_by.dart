

import 'package:flutter/material.dart';
import 'package:plant/core/core.dart';

class PoweredBy{
  PoweredBy._();

  static Widget poweredBy() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Powered by ',
              style: TextStyle(fontWeight: FontWeight.w400,
                  fontSize: Dimensions.bodySmallSize,
                  color: AppColors.lightFontColor)),
          TextSpan(
            text: 'M360 ICT',
            style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: Dimensions.bodyMediumSize,
                color: AppColors.primary),
          ),

        ],
      ),
    );
  }
}