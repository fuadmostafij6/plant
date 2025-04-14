part of 'scenario_bloc.dart';

sealed class ScenarioEvent extends Equatable {
  const ScenarioEvent();
}


class IncrementScenarioCounter extends ScenarioEvent {
  final String title;
  const IncrementScenarioCounter(this.title);

  @override
  List<Object> get props => [title];
}

class DecrementScenarioCounter extends ScenarioEvent {
  final String title;
  const DecrementScenarioCounter(this.title);

  @override
  List<Object> get props => [title];
}