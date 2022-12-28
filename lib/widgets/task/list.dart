import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';

class ListOfTask extends StatelessWidget {
  final List<Task> taskList;
  final bool? canEdit;
  final Function(int index)? onEditAction;

  const ListOfTask(
      {super.key, required this.taskList, this.canEdit, this.onEditAction});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, int index) {
              Task taskItem = taskList[index];
              return ListTile(
                selectedColor: Colors.red,
                title: Text(taskItem.title),
                leading: taskItem.isDone!
                    ? null
                    : Checkbox(
                        value: taskItem.isDone,
                        onChanged: (value) {
                          context
                              .read<TasksBloc>()
                              .add(OnDoneTask(task: taskItem));
                        },
                      ),
                trailing: GestureDetector(
                    child: taskItem.isDone!
                        ? SizedBox(
                            width: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      context
                                          .read<TasksBloc>()
                                          .add(OnDoneTask(task: taskItem));
                                    },
                                    child: Icon(Icons.restore)),
                                SizedBox(width: 20),
                                GestureDetector(
                                    onTap: () {
                                      context
                                          .read<TasksBloc>()
                                          .add(DeleteTask(task: taskItem));
                                    },
                                    child: Icon(Icons.delete))
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 70,
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onEditAction!(index);
                                    },
                                    child: Icon(Icons.edit)),
                                SizedBox(width: 20),
                                GestureDetector(
                                    onTap: () {
                                      context
                                          .read<TasksBloc>()
                                          .add(DeleteTask(task: taskItem));
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          )),
              );
            },
          ))
        ],
      );
    });
  }
}
