
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart';
import 'package:plant/core/core.dart';
class Result extends StatelessWidget {
  const Result({super.key});

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
          leading: IconButton(
            icon: const Icon(PhosphorIconsRegular.caretLeft),
            onPressed: () {
              context.pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:REdgeInsets.symmetric(horizontal: 16.0),
            child: Column(

              children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTexts.text(text: "1300", fontWeight: FontWeight.w300, fontSize:Dimensions.fontSize48, color: AppColors.primary ),
                  4.horizontalSpace,

                  Column(
                    children: [
                      AppTexts.text(text: "ppm",
                          fontWeight: FontWeight.w300,
                          fontSize: Dimensions.labelMediumSize, color: AppColors.primary),
                      12.verticalSpace,
                    ],
                  )

                ],
                          ),
              ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                8.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Very Unhealthy: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color(0xffFF5557),
                        ),
                      ),
                      TextSpan(
                        text: 'Your office is emitting a lot of Carbon Dioxide',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: Dimensions.labelLargeSize,
                          color: Color(0XFF838383),
                        ),
                      ),
                    ],
                  ),
                ),
                12.verticalSpace,
                PlantTrackerCard(totalPlants: 179, plantedCount: 18, carbonEmission: 2549,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget bar(Color color) {

    return  Container(
      width: 60.w,
      height: 7.h,
      decoration: BoxDecoration(
        color: color,
      ),
    );

  }
}





class PlantTrackerCard extends StatelessWidget {
  final int totalPlants;
  final int plantedCount;
  final int carbonEmission;

  const PlantTrackerCard({
    super.key,
    required this.totalPlants,
    required this.plantedCount,
    required this.carbonEmission,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Plant Icon
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: const Color(0xffD2FFE8),
              shape: BoxShape.circle,
            ),
            child:
            Center(child: Image.asset(PngIcon.leaf, height: 29.w, width: 29.w)),
          ),
          AppTexts.text(text: "Plant", fontSize: Dimensions.bodyMediumSize, fontWeight: FontWeight.w500, color: AppColors.primary),
          12.verticalSpace,

          // Indoor Plants Count
          AppTexts.text(text: "${totalPlants} indoor plants", fontSize: Dimensions.bodyLargeSize, fontWeight: FontWeight.w500, color: AppColors.black),


          8.verticalSpace,
          AppTexts.text(
            text: "Your office emits ${carbonEmission}ppm Carbon dioxide everyday",
            textAlign: TextAlign.center,
            color: AppColors.lightFontColor,
            fontSize: 16,
            overflow: TextOverflow.visible
          ),
          const SizedBox(height: 30),

          // Planted status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Planted",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$plantedCount/$totalPlants",
                style: const TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: plantedCount / totalPlants,
              backgroundColor: const Color(0xFFEEEEEE),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CD080)),
              minHeight: 12,
              year2023: false,
            ),
          ),
        ],
      ),
    );
  }
}

class PlantIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Drawing the plant leaf icon
    final paint1 = Paint()
      ..color = const Color(0xFF24B288)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = const Color(0xFF8ED065)
      ..style = PaintingStyle.fill;

    // Draw first leaf (teal color)
    final path1 = Path()
      ..moveTo(size.width * 0.35, size.height * 0.2)
      ..quadraticBezierTo(
          size.width * 0.1, size.height * 0.4,
          size.width * 0.3, size.height * 0.85
      )
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.6,
          size.width * 0.35, size.height * 0.2
      )
      ..close();

    // Draw second leaf (light green color)
    final path2 = Path()
      ..moveTo(size.width * 0.65, size.height * 0.2)
      ..quadraticBezierTo(
          size.width * 0.9, size.height * 0.4,
          size.width * 0.7, size.height * 0.85
      )
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.6,
          size.width * 0.65, size.height * 0.2
      )
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Example Usage
class PlantTrackerDemo extends StatelessWidget {
  const PlantTrackerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PlantTrackerCard(
            totalPlants: 189,
            plantedCount: 23,
            carbonEmission: 2549,
          ),
        ),
      ),
    );
  }
}