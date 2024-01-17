// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/models/task.dart';
import 'package:lista_tarefas_app/repositories/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository taskRepository;

  bool _justNotCompleted = false;
  List<Task> _tasks = <Task>[];

  TaskProvider(this.taskRepository) {
    _refreshTasks();
  }

  bool get justNotCompleted => _justNotCompleted;

  Future<void> setJustNotCompleted(bool value) async {
    _justNotCompleted = value;
    _refreshTasks();
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  Future<void> _refreshTasks() async {
    _tasks = await taskRepository.list(_justNotCompleted);
    notifyListeners();
  }

  Future<void> add(Task task) async {
    await taskRepository.create(task);
    _tasks.add(task);
    _refreshTasks();
  }

  Future<void> update(int id, Task task) async {
    if (task.id == 0) {
      task.id = id;
    }
    await taskRepository.update(id, task);
    _tasks[_tasks.indexWhere((element) => element.id == id)] = task;
    _refreshTasks();
  }

  Future<void> remove(int id) async {
    await taskRepository.delete(id);
    _tasks.remove(_tasks.firstWhere((element) => element.id == id));
    _refreshTasks();
  }
}
