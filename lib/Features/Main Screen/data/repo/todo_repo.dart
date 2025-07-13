import 'package:dartz/dartz.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';

abstract class TodoRepo {
Future<Either<String,Null>>insertTO({ required String taskname , required int date , required bool completed });
Either<String, Stream<List<TaskModel>>> fetchAllTodos();
Future<Either<String,Null>>updateTodo({required int id , required bool completed});
Future<Either<String,Null>>deleteTodo({required int id});
}