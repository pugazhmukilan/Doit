import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
class Task {
  late String name;
  late String information;
  late bool important;
  late bool isFinished;

  Task({
    required this.name,
    required this.information,
    required this.important,
    this.isFinished = false,
  }) {
    // Update the JSON file when the class is instantiated
    updateJsonFile();
  }

  // Convert Task object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'information': information,
      'important': important,
      'isFinished': isFinished,
    };
  }

  // Update the JSON file with the current data
  Future<void> updateJsonFile() async {
    try {
      final file = File('assets/task.json');
      List<dynamic> existingData = [];

      if (await file.exists()) {
        // Read existing data from the JSON file
        String data = await file.readAsString();
        existingData = json.decode(data);
      }

      // Add the current task data to the existing data
      existingData.add(toJson());

      // Write the updated data back to the JSON file
      await file.writeAsString(json.encode(existingData));
    } catch (e) {
      print('Error updating JSON file: $e');
    }
  }

  // Create a Task object from a JSON format
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      information: json['information'],
      important: json['important'],
      isFinished: json['isFinished'] ?? false,
    );
  }
}
  



  
Future<List<Map<String, dynamic>>> getAllTasks() async {
  try {
    String data = await rootBundle.loadString('assets/task.json');
    List<dynamic> tasks = json.decode(data);
    return tasks.cast<Map<String, dynamic>>().toList();
  } catch (e) {
    print('Error loading tasks: $e');
    return [];
  }
}
Future<List<Map<String, dynamic>>> getTasksWithStatusFalse() async {
  try {
    final tasks = await getAllTasks();
    return tasks.where((task) => !(task['status'] ?? false)).toList();
  } catch (e) {
    print('Error loading tasks with status false: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getImportantTasks() async {
  try {
    final tasks = await  getTasksWithStatusFalse();
    return tasks.where((task) => task['important']?? false == true).toList();
  } catch (e) {
    print('Error loading important tasks: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getNonImportantTasks() async {
  try {
    final tasks = await getTasksWithStatusFalse();
    return tasks.where((task) => !(task['important']?? false)).toList();
  } catch (e) {
    print('Error loading non-important tasks: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getDoneTasks() async {
  try {
    final tasks = await getAllTasks();
    return tasks.where((task) => task['status']?? false == true).toList();
  } catch (e) {
    print('Error loading done tasks: $e');
    return [];
  }
}


Future<void> updateTaskStatusByName(String taskName, bool newStatus) async {
  try {
    // Read the JSON file
    String data = await rootBundle.loadString('assets/task.json');
    List<dynamic> tasks = json.decode(data);

    // Update the task status in the JSON data
    int taskIndex = tasks.indexWhere((task) => task['name'] == taskName);
    if (taskIndex != -1) {
      tasks[taskIndex]['status'] = newStatus;

      // Write the updated data back to the JSON file
      File file = File('assets/task.json');
      await file.writeAsString(json.encode(tasks));
    } else {
      print('Task with name $taskName not found.');
    }
  } catch (e) {
    print('Error updating JSON file: $e');
  }
}