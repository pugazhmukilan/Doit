import 'dart:convert';

import "main.dart";
class Task {
  late String name;
  late String information;
  late bool important;
  late bool isfinished;

  Task({required this.name, required this.information, required this.important, this.isfinished = false});

  // Convert Task object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'information': information,
      'important': important,
      "isfinished": false,
    };
  }

  // Create a Task object from a JSON format
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      information: json['information'],
      important: json['important'],
    );
  }
}

Future<void> addObjectToList(String key, Task object) async {
  

  // Retrieve existing list from SharedPreferences
  List<String>? existingList = prefs.getStringList(key);

  // If the list doesn't exist, create a new one
  if (existingList == null) {
    existingList = [];
  }

  // Add the serialized task to the list
  existingList.add(json.encode(object));

  // Save the updated list back to SharedPreferences
  prefs.setStringList(key, existingList);
}

Future<List<Task>> getObjectList(List<String> keys) async {
  // Retrieve existing lists from SharedPreferences
  List<Task> combinedList = [];

  for (String key in keys) {
    List<String>? stringList = await prefs.getStringList(key);

    // If the list exists, deserialize each string back into a Task object and add to the combined list
    if (stringList != null) {
      combinedList.addAll(stringList.map((jsonString) => Task.fromJson(json.decode(jsonString))));
    }
  }

  return combinedList;
}
Future<void> deleteObjectByName(String key, String name) async {
  

  // Retrieve existing list from SharedPreferences
  List<String>? existingList = prefs.getStringList(key);

  // If the list doesn't exist, there's nothing to delete
  if (existingList == null) {
    return;
  }

  // Remove the task from the list based on its name
  existingList.removeWhere((jsonString) {
    Task task = Task.fromJson(json.decode(jsonString));
    return task.name == name;
  });

  // Save the updated list back to SharedPreferences
  prefs.setStringList(key, existingList);
}
