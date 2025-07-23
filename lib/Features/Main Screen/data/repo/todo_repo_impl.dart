import 'dart:developer';
import 'package:drift/drift.dart';
import 'package:to_do/Core/Services/database_service.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final DatabaseService databaseService;
  const TodoRepoImpl({required this.databaseService});
  @override
  Future<void> insertTO(
      {required String taskname,
      required int date,
      required bool completed}) async {
    try {
      await databaseService.into(databaseService.todoItems).insert(
          TodoItemsCompanion.insert(
              taskname: taskname, date: date, completed: Value(completed)));
      return;
    } catch (e) {
      log("Cannot insert in TodoRepo ${e.toString()}");
      return;
    }
  }

  @override
  Future<void> deleteTodo({required int id}) async {
    try {
      await (databaseService.delete(databaseService.todoItems)
            ..where((t) => t.id.equals(id)))
          .go();
    } catch (e) {
      log("Error while deleting ${e.toString()}");
    }
  }

  @override
  Stream<List<TaskModel>> fetchAllTodos() {
    try {
      final response =
          databaseService.select(databaseService.todoItems).watch();
      return response.map((e) => e.map((x) => TaskModel.fromJson(x)).toList());
    } catch (e) {
      log("Error while fetching tasks ${e.toString()}");
      return Stream.error(e.toString());
    }
  }

  @override
  Future<void> updateTodo({required int id, required bool completed}) async {
    try {
      await (databaseService.update(databaseService.todoItems)
            ..where((t) => t.id.equals(id)))
          .write(TodoItemsCompanion(completed: Value(completed)));
    } catch (e) {
      log("Error while updating tasks ${e.toString()}");
    }
  }
}
