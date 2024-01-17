import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/shared/widgets/just_not_completed_switch.dart';
import 'package:provider/provider.dart';
import 'package:lista_tarefas_app/main.dart';
import 'package:lista_tarefas_app/repositories/task_repository.dart';
import 'package:lista_tarefas_app/services/task_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
            create: (_) => TaskProvider(getIt<TaskRepository>())),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              const JustNotCompletedSwitch(),
              Expanded(
                child: Consumer<TaskProvider>(
                    builder: (context, taskProvider, widget) {
                  var tasks = taskProvider.tasks;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (_, index) {
                      var task = tasks[index];
                      return TaskItem(task: task);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
        floatingActionButton:
            Consumer<TaskProvider>(builder: (context, taskProvider, widget) {
          return FloatingActionButton(
            onPressed: () {
              var taskProvider =
                  Provider.of<TaskProvider>(context, listen: false);
              showDialog(
                context: context,
                builder: (_) {
                  return AddTaskDialog(taskProvider: taskProvider);
                },
              );
            },
            tooltip: 'Adicionar',
            child: const Icon(Icons.add_task),
          );
        }),
      ),
    );
  }
}
