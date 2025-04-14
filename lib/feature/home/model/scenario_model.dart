

import 'package:equatable/equatable.dart';

class ScenarioCounterModel extends Equatable {
  final String title;
  final int count;

  const ScenarioCounterModel({
    required this.title,
    this.count = 0,
  });

  ScenarioCounterModel copyWith({int? count}) {
    return ScenarioCounterModel(
      title: title,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [title, count];
}