import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';
import 'package:task_app/widgets/app/drawer.dart';
import 'package:task_app/widgets/task/form_task.dart';
import 'package:task_app/widgets/task/list.dart';

class PendingListScreen extends StatefulWidget {
  @override
  State<PendingListScreen> createState() => _PendingListScreenState();
}

class _PendingListScreenState extends State<PendingListScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FormTask();
        });
  }

  void _editTask(BuildContext context, Task item) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FormTask(itemTask: item);
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pending Tasks'),
          ),
          drawer: DrawerApp(),
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListOfTask(
                      onEditAction: (index) {
                        _editTask(
                            context,
                            state.allTask
                                .where((element) => !element.isDone!)
                                .toList()[index]);
                      },
                      taskList: state.allTask
                          .where((element) => !element.isDone!)
                          .toList())),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _addTask(context),
          ),
        );
      },
    );
  }
}
