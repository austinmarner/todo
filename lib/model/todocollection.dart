import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class TodoCollection extends ChangeNotifier {
  String _title;
  List<Todo> _todo;
  int _isDoneCount = 0;
  int _totalTasks;
  ColorSwatch _accentColor = Colors.blue;

  TodoCollection({@required String title, List<Todo> todo})
      : assert(title != null),
        _title = title,
        _todo = todo ?? [],
        _totalTasks = todo.length;

  String get title => _title;

  int get isDoneCount => _isDoneCount;

  int get totalTasks => _totalTasks;

  ColorSwatch get accentColor => _accentColor;

  List<Todo> get todo => _todo;

  set changeTitle(String title) {
    if (title == _title) return;
    _title = title;
    notifyListeners();
  }

  set changeAccentColor(ColorSwatch accentColor) {
    if (accentColor == _accentColor) return;
    _accentColor = accentColor;
    notifyListeners();
  }

  void updateTotalTasks() {
    _totalTasks = todo.length;
  }

  void updateDoneCount() {
    int temp = 0;
    todo.forEach((element) {
      if (element.isDone == true) {
        temp++;
      }
    });
    _isDoneCount = temp;
    notifyListeners();
  }

  void addTodo(String title) {
    Todo temp = Todo(title: 'title');
    _todo.add(temp);
    updateTotalTasks();
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todo.removeAt(index);
    updateTotalTasks();
    notifyListeners();
  }
}
