import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';
import 'package:uuid/uuid.dart';

class FormTask extends StatefulWidget {
  Task? itemTask;
  FormTask({this.itemTask});
  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  TextEditingController controllerNameTask = TextEditingController();
  bool isDone = false;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.itemTask != null) {
      isDone = widget.itemTask!.isDone!;
      controllerNameTask.text = widget.itemTask!.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              TextField(
                controller: controllerNameTask,
                decoration: InputDecoration(hintText: 'Enter task name'),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Is this completed?'),
                  Switch(
                      activeColor: Color(0xffeaac8b),
                      value: isDone,
                      onChanged: (bool value) {
                        setState(() {
                          isDone = !isDone;
                        });
                      })
                ],
              ),
              SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffeaac8b),
                      ),
                      onPressed: () {
                        if (widget.itemTask != null) {
                          var updatedTask = Task(
                              id: widget.itemTask?.id,
                              userId: 200,
                              title: controllerNameTask.text,
                              isDone: isDone);
                          context
                              .read<TasksBloc>()
                              .add(UpdateSingleTask(task: updatedTask));
                        } else {
                          final now = DateTime.now();
                          int id = now.microsecondsSinceEpoch;
                          var newTask = Task(
                              id: id,
                              userId: 200,
                              title: controllerNameTask.text,
                              isDone: isDone);
                          context.read<TasksBloc>().add(AddTask(task: newTask));
                        }
                        Navigator.pop(context);
                      },
                      child: Text('Save')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
