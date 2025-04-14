


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plant/core/constants/app_constant/app_constants.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart';
import 'package:plant/core/routes/app_routes.dart';
import 'package:plant/feature/home/bloc/scenario_bloc.dart';
import 'package:plant/feature/home/widget/counter/counter.dart';
import 'package:plant/packages/auto_size_textField/auto_sized_textField.dart';

class AddScreen extends StatelessWidget {

  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: "Office");
    return  Container(
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
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: REdgeInsets.all(8),
            
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(PngIcon.office, width: 28.w,height: 28.w,)),
                    12.horizontalSpace,
                    Flexible(child: AppTextField.autoSizedTextFiled(context, controller: controller, maxLine: 1))
            
                  ],
                ),
                20.verticalSpace,
            Expanded(
              child: BlocBuilder<ScenarioBloc, ScenarioCounterState>(
                builder: (context, state) {

                  return ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    itemCount: state.scenarios.length,
                    itemBuilder: (context, index) {
                      final scenario = state.scenarios[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ScenarioCounter(
                          title: scenario.title,
                          count: scenario.count,
                          onIncrement: () {
                            context.read<ScenarioBloc>().add(
                                IncrementScenarioCounter(scenario.title));
                          },
                          onDecrement: () {
                            context.read<ScenarioBloc>().add(
                                DecrementScenarioCounter(scenario.title));
                          },
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return 12.verticalSpace;
                  },
                  );
                },
              ),
            ),
            
               Padding(
                 padding: REdgeInsets.symmetric(horizontal: 16.0),
                 child: Row(
                   children: [
                     Expanded(child: AppButton.filledButton(load: false, text: "Calculate Carbon Emission",
                     onPressed: (){
                       final state = context.read<ScenarioBloc>().state;
                       double carbonEmission = calculateCarbonEmission(state.scenarios);
                      // double carbonEmission = calculateCarbonEmission(state.scenarios);
                       context.go("${AppRoutes.HOME}${AppRoutes.Add_SCREEN}${AppRoutes.RESULT}");

                     }
                     )

                     ),
                   ],
                 ),
               ),
                24.verticalSpace,
            
            
              ],
            
            
            ),
          )
        ));
  }
}




