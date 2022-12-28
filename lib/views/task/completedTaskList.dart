import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';
import 'package:task_app/widgets/app/drawer.dart';
import 'package:task_app/widgets/task/form_task.dart';
import 'package:task_app/widgets/task/list.dart';

class CompletedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> list =
            state.allTask.where((element) => element.isDone!).toList();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe56b6f),
            title: const Text('Completed Tasks'),
          ),
          drawer: DrawerApp(),
          body: Container(
              child: list.isEmpty
                  ? Center(
                      child: Text('No completed tasks'),
                    )
                  : ListOfTask(taskList: list)),
        );
      },
    );
  }
}
