part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final bool isLoading;
  final List<Task> allTask;
  const TasksState({this.isLoading = false, this.allTask = const <Task>[]});

  @override
  List<Object> get props => [isLoading, allTask];

  Map<String, dynamic> toMap() {
    return {
      'isLoading': false,
      'allTask': allTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        isLoading: map['isLoading'],
        allTask: List<Task>.from(
            map['allTask']?.map((x) => Task.fromJSONResponse(x))));
  }
}
