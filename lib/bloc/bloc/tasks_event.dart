part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class GetTasks extends TasksEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  // TODO: implement props
  List<Object> get props => [task];
}

class OnDoneTask extends TasksEvent {
  final Task task;
  const OnDoneTask({required this.task});

  @override
  // TODO: implement props
  List<Object> get props => [task];
}

class UpdateSingleTask extends TasksEvent {
  final Task task;
  const UpdateSingleTask({required this.task});

  @override
  // TODO: implement props
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  // TODO: implement props
  List<Object> get props => [task];
}

class LoadingTasks extends TasksEvent {
  const LoadingTasks();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
