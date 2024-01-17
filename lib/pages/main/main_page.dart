import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/models/task.dart';
import 'package:lista_tarefas_app/shared/widgets/add_task_dialog.dart';
import 'package:lista_tarefas_app/shared/widgets/task_item.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) {
            return TaskItem(task: Task(1, "Tarefa 1", false));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return const AddTaskDialog();
            },
          );
        },
        tooltip: 'Adicionar',
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
