import 'package:flutter/material.dart';
import 'package:task_app/views/task/deletedTaskList.dart';
import 'package:task_app/views/task/taskList.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (BuildContext context) => TaskListScreen(),
    '/deleted/tasks': (BuildContext context) => DeletedTasksScreen()
  };
}
