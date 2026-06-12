import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
    );
    _tasks.add(newTask);
    notifyListeners();
  }

  void deleteAllTasks() {
    _tasks.clear();
    notifyListeners();
  }
}