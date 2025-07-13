import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/Core/Services/get_it.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/daily_tasks.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/main_screen_body.dart';

class MainScreenStream extends StatelessWidget {
  const MainScreenStream({super.key, required this.alltasks});
  final Stream<List<TaskModel>> alltasks;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: alltasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Failed to load tasks"));
          } else {
            return MainScreenBody(data: snapshot.data!);
          }
        });
  }
}

