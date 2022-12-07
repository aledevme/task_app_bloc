import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';
import 'package:task_app/widgets/task/create_task.dart';
import 'package:task_app/widgets/task/list.dart';

class TaskListScreen extends StatelessWidget {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CreateTaskForm();
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
          drawer: Drawer(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 70, bottom: 30, left: 30),
                color: Color(0xffe56b6f),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                                'https://xsgames.co/randomusers/assets/avatars/male/74.jpg'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Alejandro Gonzalez',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Flutter developer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.only(top: 20),
                children: [
                  ListTile(
                    title: Text(
                      'Notas eliminadas',
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                )),
                            Positioned(
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 20,
                                    height: 20,
                                    color: Color(0xffeaac8b),
                                    child: Text(
                                      '${taskList.where((element) => element.isDeleted!).length}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          )),
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
