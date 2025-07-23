import 'package:flutter/material.dart';
import 'package:to_do/Core/utils/appimages.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/add_task_bottom_sheet.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/daily_tasks.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key, required this.data});
  final List<TaskModel> data;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.assetsImagesCircleshape),
          Center(child: Image.asset(AppImages.assetsImagesClock)),
          DailyTasks(data: data),
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddTaskBottomSheet();
                  });
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

