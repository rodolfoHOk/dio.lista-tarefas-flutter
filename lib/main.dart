import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lista_tarefas_app/repositories/impl/sqlite_database.dart';
import 'package:lista_tarefas_app/repositories/impl/task_sqlite_repository.dart';
import 'package:lista_tarefas_app/repositories/task_repository.dart';
import 'package:lista_tarefas_app/task_list_app.dart';

var getIt = GetIt.asNewInstance();

void setupGetIt() {
  getIt.registerSingletonAsync<TaskRepository>(
    () async => TaskSQLiteRepository(await SQLiteDatabase.getDatabase()),
  );
}

void main() {
  setupGetIt();

  runApp(const TaskListApp());
}
