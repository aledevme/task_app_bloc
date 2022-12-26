import 'package:flutter/material.dart';
import 'package:task_app/views/task/completedTaskList.dart';
import 'package:task_app/views/task/pendingTaskList.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (BuildContext context) => PendingListScreen(),
    '/completed/tasks': (BuildContext context) => CompletedTasksScreen()
  };
}
