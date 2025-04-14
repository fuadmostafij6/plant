part of 'scenario_bloc.dart';

sealed class ScenarioState extends Equatable {
  const ScenarioState();
}

final class ScenarioCounterState extends ScenarioState {
  final List<ScenarioCounterModel> scenarios;

  const ScenarioCounterState({this.scenarios = const []});

  @override
  List<Object> get props => [scenarios];
}
