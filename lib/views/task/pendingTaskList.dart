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
        isScrollControlled: true,
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
        List<Task> list =
            state.allTask.where((element) => !element.isDone!).toList();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffe56b6f),
            title: const Text('Pending Tasks'),
            actions: [
              GestureDetector(
                onTap: () {
                  context.read<TasksBloc>().add(CheckAllTasks());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.done_all),
                ),
              )
            ],
          ),
          drawer: DrawerApp(),
          body: Container(
              child: list.isEmpty
                  ? Center(
                      child: Text('No pending tasks'),
                    )
                  : ListOfTask(
                      onEditAction: (index) {
                        _editTask(
                            context,
                            state.allTask
                                .where((element) => !element.isDone!)
                                .toList()[index]);
                      },
                      taskList: list)),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffeaac8b),
            child: Icon(Icons.add),
            onPressed: () => _addTask(context),
          ),
        );
      },
    );
  }
}
