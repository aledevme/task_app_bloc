import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/router/router.dart';
import 'package:task_app/views/task/taskList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: getRoutes(),
      ),
    );
  }
}
