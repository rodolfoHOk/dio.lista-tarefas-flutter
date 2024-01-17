import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_tarefas_app/main.dart';
import 'package:lista_tarefas_app/pages/main/main_page.dart';
import 'package:lista_tarefas_app/repositories/task_repository.dart';
import 'package:lista_tarefas_app/services/task_provider.dart';

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(getIt<TaskRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const MainPage(title: 'Lista de Tarefas'),
      ),
    );
  }
}
