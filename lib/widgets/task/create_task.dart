import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc_exports.dart';
import 'package:task_app/models/Task.dart';
import 'package:uuid/uuid.dart';

class CreateTaskForm extends StatefulWidget {
  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  TextEditingController controllerNameTask = TextEditingController();
  bool isDone = false;
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              controller: controllerNameTask,
              decoration:
                  InputDecoration(hintText: 'Ingresa nombre de la tarea'),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Esta completada?'),
                Switch(
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      var newTask = Task(
                          id: uuid.v4(),
                          title: controllerNameTask.text,
                          isDone: isDone);
                      context.read<TasksBloc>().add(AddTask(task: newTask));
                      Navigator.pop(context);
                    },
                    child: Text('Guardar')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
