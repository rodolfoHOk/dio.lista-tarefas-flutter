import 'package:lista_tarefas_app/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> list(bool justNotCompleted);

  Future<void> create(Task task);

  Future<void> update(Task task);

  Future<void> delete(int id);
}
