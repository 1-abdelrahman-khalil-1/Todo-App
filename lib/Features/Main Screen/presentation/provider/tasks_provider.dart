import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/Core/Services/get_it.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';

final todoRepoProvider = Provider<TodoRepo>((ref) {
  return get_it<TodoRepo>();
});

final tasksStreamProvider = StreamProvider<List<TaskModel>>((ref) {
  final todoRepo = ref.watch(todoRepoProvider);
  return todoRepo.fetchAllTodos();
});

