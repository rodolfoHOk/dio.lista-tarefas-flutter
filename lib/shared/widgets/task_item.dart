import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_tarefas_app/models/task.dart';
import 'package:lista_tarefas_app/services/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id.toString()),
      onDismissed: (_) async {
        await Provider.of<TaskProvider>(context, listen: false).remove(task.id);
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: const Icon(Icons.task_outlined),
          title: Text(task.description),
          trailing: Switch(
            value: task.completed,
            onChanged: (value) async {
              task.completed = value;
              await Provider.of<TaskProvider>(context, listen: false)
                  .update(task.id, task);
            },
          ),
        ),
      ),
    );
  }
}
