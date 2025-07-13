import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/Core/Services/get_it.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/taskname_input.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/hour_input.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({
    super.key,
    this.onSaved,
    this.validator,
  });

  final void Function(String?)? onSaved;
  final String Function(String?)? validator;

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskNameController = TextEditingController();
  int hour = 0;
  @override
  void dispose() {
    _taskNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Add New Task',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              // Task name input
              TaskNameInput(
                controller: _taskNameController,
                onSaved: widget.onSaved,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the task name';
                  }
                  return null;
                },
                hintText: 'Name of the task',
                labelText: 'Task',
              ),
              SizedBox(height: 16.h),
              HourInput(
                onChanged: (val) {
                  hour = val!;
                },
                hour: hour,
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final taskname = _taskNameController.text;
                    get_it<TodoRepo>().insertTO(taskname: taskname, date: hour, completed: false);
                    get_it<TodoRepo>().fetchAllTodos();
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(16.h),
                ),
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
