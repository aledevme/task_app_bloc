import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';

import 'package:task_app/widgets/task/list.dart';

class TaskListScreen extends StatelessWidget {
  TextEditingController controllerNameTask = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextField(
                    controller: controllerNameTask,
                    decoration:
                        InputDecoration(hintText: 'Ingresa nombre de la tarea'),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Esta completada?'),
                      Switch(value: true, onChanged: (bool value) => {})
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text('TaskList'),
          ),
          body: Container(child: ListOfTask(taskList: taskList)),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _addTask(context),
          ),
        );
      },
    );
  }
}
