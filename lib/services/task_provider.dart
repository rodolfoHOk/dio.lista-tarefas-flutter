// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/models/task.dart';
import 'package:lista_tarefas_app/repositories/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository taskRepository;

  bool _justNotCompleted = false;
  List<Task> _tasks = <Task>[];

  TaskProvider(this.taskRepository);

  bool get justNotCompleted => _justNotCompleted;

  Future<void> setJustNotCompleted(bool value) async {
    _justNotCompleted = value;
    _tasks = await _getTasks();
    notifyListeners();
  }

  Future<List<Task>> get tasks async {
    if (_tasks.isEmpty) {
      _tasks = await _getTasks();
    }
    return _tasks;
  }

  Future<List<Task>> _getTasks() async {
    return await taskRepository.list(_justNotCompleted);
  }

  Future<void> add(Task task) async {
    await taskRepository.create(task);
    _tasks.add(task);
    notifyListeners();
  }

  Future<void> update(int id, Task task) async {
    if (task.id == 0) {
      task.id = id;
    }
    await taskRepository.update(id, task);
    _tasks[_tasks.indexWhere((element) => element.id == id)] = task;
    notifyListeners();
  }

  Future<void> remove(int id) async {
    await taskRepository.delete(id);
    _tasks.remove(_tasks.firstWhere((element) => element.id == id));
    notifyListeners();
  }
}
