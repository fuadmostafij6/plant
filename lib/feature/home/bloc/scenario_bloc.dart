import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant/feature/home/model/scenario_model.dart' show ScenarioCounterModel;

part 'scenario_event.dart';
part 'scenario_state.dart';

class ScenarioBloc extends Bloc<ScenarioEvent, ScenarioCounterState> {
  ScenarioBloc() : super(ScenarioCounterState(
    scenarios: const [
      ScenarioCounterModel(title: 'Total number of people'),
      ScenarioCounterModel(title: 'Total number of rooms'),
      ScenarioCounterModel(title: 'Total area (sqft.)'),
      ScenarioCounterModel(title: 'Total AC'),
      ScenarioCounterModel(title: 'Total Refrigerator'),
      ScenarioCounterModel(title: 'Total Computers'),
      ScenarioCounterModel(title: 'Total Indoor Plants'),
      ScenarioCounterModel(title: 'Total Kitchen Burner'),
    ],
  )) {
    on<IncrementScenarioCounter>((event, emit) {
      final updated = state.scenarios.map((scenario) {
        if (scenario.title == event.title) {
          return scenario.copyWith(count: scenario.count + 1);
        }
        return scenario;
      }).toList();
      emit(ScenarioCounterState(scenarios: updated));
    });

    on<DecrementScenarioCounter>((event, emit) {
      final updated = state.scenarios.map((scenario) {
        if (scenario.title == event.title && scenario.count > 0) {
          return scenario.copyWith(count: scenario.count - 1);
        }
        return scenario;
      }).toList();
      emit(ScenarioCounterState(scenarios: updated));
    });
  }
}



// ─── CARBON EMISSION CALCULATION ──────────────────────────────
double calculateCarbonEmission(List<ScenarioCounterModel> scenarios) {
  double totalEmission = 0;
  // You can adjust these factors based on your criteria.
  Map<String, double> factorMapping = {
    'Total number of people': 1.0,
    'Total number of rooms': 1.5,
    'Total area (sqft.)': 0.5,
    'Total AC': 2.0,
    'Total Refrigerator': 1.8,
    'Total Computers': 1.2,
    'Total Indoor Plants': 0.2,
    'Total Kitchen Burner': 1.7,
  };

  for (final scenario in scenarios) {
    double factor = factorMapping[scenario.title] ?? 1.0;
    totalEmission += scenario.count * factor;
  }
  return totalEmission;
}

