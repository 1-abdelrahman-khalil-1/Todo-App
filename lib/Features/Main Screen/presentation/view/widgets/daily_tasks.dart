import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/Features/Main%20Screen/data/models/task_model.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/card_item.dart';

class DailyTasks extends StatelessWidget {
  const DailyTasks({
    super.key, required this.data
  });
final List<TaskModel> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 36.h,
            children: [
            Text("Daily Tasks List" , style: TextStyle(fontSize: 24.sp , fontWeight: FontWeight.bold),),
            Card(
              elevation: 8,
              color: Colors.white,
              child: SizedBox(
              height: 300.h,
              width: double.infinity,
              child:data.isEmpty ? Center(child: Text("No Tasks" , style: TextStyle(fontSize: 24.sp),)) : Scrollbar(
                thickness: 4,
                radius: Radius.circular(10),
                child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CardItem(task: data[index]);
                },
                ),
              ),
              ),
            ),
            ],
          ),
    );
  }
}