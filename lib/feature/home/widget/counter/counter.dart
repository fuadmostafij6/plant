

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant/core/core.dart';
class ScenarioCounter extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ScenarioCounter({
    super.key,
    required this.title,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                height: 19.w,
                width: 19.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              8.horizontalSpace,
              AppTexts.text(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ),
        Row(
          children: [
            _actionButton(icon: Icons.remove, onTap: onDecrement),
            10.horizontalSpace,
            AppTexts.text(
              text: "$count",
              fontSize: 24.sp,
              fontWeight: FontWeight.w300,
            ),
            10.horizontalSpace,
            _actionButton(icon: Icons.add, onTap: onIncrement),
          ],
        ),
      ],
    );
  }

  Widget _actionButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 22.w,
        width: 22.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(218.09 * (3.141592653589793 / 180)),
            colors: [
              const Color(0xFFF7F7F7),
              const Color(0xFFE7E7E7),
            ],
            stops: const [0.0687, 1.1151],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
