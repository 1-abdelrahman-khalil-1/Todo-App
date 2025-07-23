import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';

abstract class TodoRepo {
  Future<void> insertTO(
      {required String taskname, required int date, required bool completed});
  Stream<List<TaskModel>> fetchAllTodos();
  Future<void> updateTodo({required int id, required bool completed});
  Future<void> deleteTodo({required int id});
}
