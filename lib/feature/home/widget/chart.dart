

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant/core/constants/app_constant/app_constants.dart';
class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final List<FlSpot> co2Data = [
    FlSpot(0, 500), // Oct 24
    FlSpot(1, 600), // Nov 24
    FlSpot(2, 700), // Dec 24
    FlSpot(3, 640), // Jan 25
    FlSpot(4, 650), // Feb 25
    FlSpot(5, 680), // Mar 25
    FlSpot(6, 520), // Apr 25
  ];
  @override
  Widget build(BuildContext context) {

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
        drawVerticalLine: false,

          getDrawingHorizontalLine: (value) {
            return  FlLine(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color.fromRGBO(71, 186, 128, 0.1),
                  const Color.fromRGBO(71, 186, 128, 0.1),
                  const Color.fromRGBO(71, 186, 128, 0.1),
                ],
                stops: const [0.0, 0.4227, 1.0],
              ),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30.h,
              getTitlesWidget: (value, meta) {
                const months = ['Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr'];
                return

                  SideTitleWidget(
                    space: 4,
                    meta: meta,
                    fitInside:  SideTitleFitInsideData.fromTitleMeta(meta, distanceFromEdge: 0),
                    child: Column(
                      children: [
                        AppTexts.text(text: months[value.toInt()],
                            color: AppColors.lightFontColor,
                            fontSize: Dimensions.labelMediumSize, fontWeight: FontWeight.w700),
                        AppTexts.text(text: '24',
                            color: AppColors.lightFontColor,
                            fontSize: Dimensions.labelMediumSize, fontWeight: FontWeight.w700),
                      ],
                    )
                  );
                  Column(
                  children: [

                  ],
                );
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: true,
        border: Border(left: BorderSide(color: Color(0xffD9D9D9)),
        bottom: BorderSide(color: Color(0xffD9D9D9))
        )
        ),
        minX: 0,
        maxX: 6,
        minY: 400,
        maxY: 800,
        lineBarsData: [
          LineChartBarData(
            spots: co2Data,
            isCurved: true,

            color: AppColors.primary,



            dotData: FlDotData(show: true,



              getDotPainter: (spot, percent, barData, index) {

                  return FlDotCirclePainter(

                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: AppColors.primary,
                  );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              // gradient: LinearGradient(
              //   // colors: [
              //   //   widget.lineColor.withValues(alpha: 0.5),
              //   //   widget.lineColor.withValues(alpha: 0),
              //   // ],
              //   stops: const [0.5, 1.0],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
              color: Colors.transparent,
              spotsLine: BarAreaSpotsLine(
                show: true,
                flLineStyle: FlLine(
                  color: AppColors.primary,
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF2DF28F),
                      Color.fromRGBO(109, 253, 181, 0.05),
                    ],
                  ),

                  strokeWidth: 1 ,
                ),
                checkToShowSpotLine: (spot) {
                  if (spot.x == 0 || spot.x == 6) {
                    return false;
                  }

                  return true;
                },
              ),
            ),

            barWidth: 1,
          ),
        ],

      ),
    );
  }
}




