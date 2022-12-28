part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTask;
  const TasksState({this.allTask = const <Task>[]});

  @override
  List<Object> get props => [allTask];

  Map<String, dynamic> toMap() {
    return {
      'allTask': allTask.map((x) => x.toMap()).toList(),
    };
  }

  TasksState copyWith({List<Task>? allTask, bool? ableToCheckAllTasks}) {
    return TasksState(allTask: allTask ?? this.allTask);
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        allTask: List<Task>.from(
            map['allTask']?.map((x) => Task.fromJSONResponse(x))));
  }
}
