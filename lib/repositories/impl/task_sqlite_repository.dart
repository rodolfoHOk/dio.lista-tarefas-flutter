import 'package:lista_tarefas_app/models/task.dart';
import 'package:lista_tarefas_app/repositories/task_repository.dart';
import 'package:sqflite/sqflite.dart';

class TaskSQLiteRepository implements TaskRepository {
  final Database db;

  TaskSQLiteRepository(this.db);

  @override
  Future<List<Task>> list(bool justNotCompleted) async {
    var result = await db.rawQuery(justNotCompleted
        ? '''SELECT id, description, completed FROM tasks WHERE completed = 0'''
        : '''SELECT id, description, completed FROM tasks''');
    return result
        .map((element) => Task(
            int.tryParse(element['id'].toString()) ?? 0,
            element['description'].toString(),
            int.tryParse(element['completed'].toString()) == 1))
        .toList();
  }

  @override
  Future<void> create(Task task) async {
    await db.rawInsert(
        '''INSERT INTO tasks (description, completed) VALUES (?,?)''',
        [task.description, task.completed]);
  }

  @override
  Future<void> update(int id, Task task) async {
    if (task.id == 0) {
      task.id = id;
    }
    await db.rawUpdate(
        '''UPDATE tasks SET description = ?, completed = ? WHERE id = ?''',
        [task.description, task.completed, task.id]);
  }

  @override
  Future<void> delete(int id) async {
    await db.rawDelete('''DELETE FROM tasks WHERE id = ?''', [id]);
  }
}
