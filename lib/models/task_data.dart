import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_management/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone(); //이게 변했다는 것을
    notifyListeners(); //알아채
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
