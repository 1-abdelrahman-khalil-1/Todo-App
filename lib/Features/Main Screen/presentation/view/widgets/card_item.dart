import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/Core/Services/get_it.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
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
          Text("${task.date}:00", style: TextStyle(fontSize: 16.sp),),
          IconButton(
            icon:  Icon(Icons.delete, color: Colors.redAccent[200]),
            onPressed: () {
              get_it<TodoRepo>().deleteTodo(id: task.id);
              get_it<TodoRepo>().fetchAllTodos();
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
          get_it<TodoRepo>().updateTodo(id: task.id, completed: value!);
          get_it<TodoRepo>().fetchAllTodos();
        },
      ),
    );
  }
}
