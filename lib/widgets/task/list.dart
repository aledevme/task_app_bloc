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
              leading: Checkbox(
                value: taskItem.isDone,
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: taskItem));
                },
              ),
              trailing: GestureDetector(
                  onTap: () {
                    context.read<TasksBloc>().add(DeleteTask(task: taskItem));
                  },
                  child: Icon(Icons.delete)),
            );
          },
        ))
      ],
    );
  }
}
