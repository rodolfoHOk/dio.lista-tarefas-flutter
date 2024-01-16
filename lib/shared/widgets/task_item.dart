import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      onDismissed: (_) {},
      child: ListTile(
        title: Text(task.description),
        trailing: Switch(
          value: task.completed,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
