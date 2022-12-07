import 'package:flutter/material.dart';
import 'package:task_app/models/Task.dart';

class ListOfTask extends StatelessWidget {
  final List<Task> taskList;
  const ListOfTask({required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(taskList[index].title),
              leading: Checkbox(
                value: taskList[index].isDone,
                onChanged: (value) {
                  print(value);
                },
              ),
            );
          },
        ))
      ],
    );
  }
}
