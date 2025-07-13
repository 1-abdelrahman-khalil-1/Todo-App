import 'package:to_do/Core/Services/database_service.dart';

class TaskModel {
  final int id;
  final String taskname;
  final int date;
  final bool completed;

  TaskModel({required this.id, required this.taskname, required this.date, required this.completed});  
TaskModel.fromJson(TodoItem json)
    : id = json.id,
      taskname = json.taskname,
      date = json.date,
      completed = json.completed;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskname': taskname,
      'date': date,
      'completed': completed,
    };
  }
}