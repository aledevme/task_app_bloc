import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/models/Task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(allTask: List.from(state.allTask)..add(event.task)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(allTask: List.from(state.allTask)..add(event.task)));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(allTask: List.from(state.allTask)..add(event.task)));
  }
}
