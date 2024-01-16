// ignore_for_file: unnecessary_getters_setters

class Task {
  int _id = 0;
  String _description = "";
  bool _completed = false;

  Task.blank();

  Task.create(this._description, this._completed);

  Task(this._id, this._description, this._completed);

  int get id => _id;
  set id(int id) => _id = id;

  String get description => _description;
  set description(String description) => _description = description;

  bool get completed => _completed;
  set completed(bool completed) => _completed = completed;
}
