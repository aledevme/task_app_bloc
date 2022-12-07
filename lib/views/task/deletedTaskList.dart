import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';
import 'package:task_app/widgets/app/drawer.dart';
import 'package:task_app/widgets/task/create_task.dart';
import 'package:task_app/widgets/task/list.dart';

class DeletedTasksScreen extends StatelessWidget {
  // void _addTask(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return CreateTaskForm();
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tareas eliminadas'),
          ),
          drawer: DrawerApp(),
          body: Container(
              child: ListOfTask(
                  taskList: taskList
                      .where((element) => element.isDeleted!)
                      .toList())),
        );
      },
    );
  }
}
