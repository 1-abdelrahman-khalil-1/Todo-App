import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/presentation/provider/tasks_provider.dart';

class CardItem extends ConsumerWidget {
  const CardItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoRepo = ref.read(todoRepoProvider);

    return ListTile(
      title: Text(
        task.taskname,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: task.completed ? Colors.blueGrey : Colors.black,
          decoration: task.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${task.date}:00",
            style: TextStyle(fontSize: 16.sp),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent[200]),
            onPressed: () {
              // Using Riverpod to access the repository
              todoRepo.deleteTodo(id: task.id);
              // No need to manually call fetchAllTodos() as the StreamProvider will handle updates
            },
          ),
        ],
      ),
      leading: Checkbox(
        value: task.completed,
        checkColor: Colors.transparent,
        fillColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.teal;
          }
          return Colors.white;
        }),
        onChanged: (value) {
          // Using Riverpod to access the repository
          todoRepo.updateTodo(id: task.id, completed: value!);
          // No need to manually call fetchAllTodos() as the StreamProvider will handle updates
        },
      ),
    );
  }
}
