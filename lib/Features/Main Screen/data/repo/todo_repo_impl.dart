import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:to_do/Core/Services/database_service.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final DatabaseService databaseService;
  const TodoRepoImpl({required this.databaseService});
  @override
  Future<Either<String, Null>> insertTO(
      {required String taskname,
      required int date,
      required bool completed}) async {
    try {
      await databaseService.into(databaseService.todoItems).insert(
          TodoItemsCompanion.insert(
              taskname: taskname, date: date, completed: Value(completed)));
      return const Right(null);
    } catch (e) {
      log("Cannot insert in TodoRepo ${e.toString()}");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> deleteTodo({required int id}) async {
    try {
      await (databaseService.delete(databaseService.todoItems)
            ..where((t) => t.id.equals(id)))
          .go();
      return const Right(null);
    } catch (e) {
      log("Error while deleting ${e.toString()}");
      return Left(e.toString());
    }
  }

  @override
  Either<String, Stream<List<TaskModel>>> fetchAllTodos() {
    try {
      final response =
          databaseService.select(databaseService.todoItems).watch();
      return Right(
          response.map((e) => e.map((x) => TaskModel.fromJson(x)).toList()));
    } catch (e) {
      log("Error while fetching tasks ${e.toString()}");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> updateTodo(
      {required int id, required bool completed}) async {
    try {
      await (databaseService.update(databaseService.todoItems)
            ..where((t) => t.id.equals(id)))
          .write(TodoItemsCompanion(completed: Value(completed)));
      return const Right(null);
    } catch (e) {
      log("Error while updating tasks ${e.toString()}");
      return Left(e.toString());
    }
  }
}
