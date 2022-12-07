import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';

class ListOfTask extends StatelessWidget {
  final List<Task> taskList;
  const ListOfTask({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            Task taskItem = taskList[index];
            return ListTile(
              title: Text(taskItem.title),
              leading: taskItem.isDeleted! == true
                  ? null
                  : Checkbox(
                      value: taskItem.isDone,
                      onChanged: (value) {
                        context
                            .read<TasksBloc>()
                            .add(UpdateTask(task: taskItem));
                      },
                    ),
              trailing: GestureDetector(
                  onTap: () {
                    if (taskItem.isDeleted!) {
                      context
                          .read<TasksBloc>()
                          .add(RestoreTask(task: taskItem));
                    } else {
                      context.read<TasksBloc>().add(DeleteTask(task: taskItem));
                    }
                  },
                  child: taskItem.isDeleted!
                      ? Icon(Icons.restore)
                      : Icon(Icons.delete)),
            );
          },
        ))
      ],
    );
  }
}
