import 'package:equatable/equatable.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<CheckAllTasks>(_onCompleteAllTask);
    on<OnDoneTask>(_onDoneTask);
    on<UpdateSingleTask>(_onUpdateSingleTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> taskList = List.from(state.allTask)..add(event.task);
    emit(TasksState(allTask: taskList));
  }

  void _onCompleteAllTask(CheckAllTasks event, Emitter<TasksState> emit) {
    List<Task> newList = [
      ...state.allTask.map((item) => item.copyWith(isDone: true)),
    ];

    emit(TasksState(allTask: [...newList]));
  }

  void _onDoneTask(OnDoneTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index =
        state.allTask.indexWhere((element) => element.id == event.task.id);

    List<Task> allTask = List.from(state.allTask)..removeAt(index);

    task.isDone == false
        ? allTask.insert(index, task.copyWith(title: task.title, isDone: true))
        : allTask.insert(
            index, task.copyWith(title: task.title, isDone: false));

    emit(TasksState(allTask: allTask));
  }

  void _onUpdateSingleTask(UpdateSingleTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index =
        state.allTask.indexWhere((element) => element.id == event.task.id);
    List<Task> allTask = List.from(state.allTask)..removeAt(index);
    allTask.insert(index, task);
    emit(TasksState(allTask: allTask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> allTask = List.from(state.allTask)..remove(task);
    emit(TasksState(allTask: allTask));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    // TODO: implement toJson
    return state.toMap();
  }
}
