import 'package:flutter/material.dart';
import 'package:to_do/Core/Services/get_it.dart';
import 'package:to_do/Features/Main%20Screen/presentation/view/widgets/main_screen_stream.dart';

import '../../data/repo/todo_repo.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoRepo todoRepo = get_it<TodoRepo>();
    final alltasks = todoRepo.fetchAllTodos();
     return SafeArea(child: Scaffold(
      
      body: alltasks.fold((e){
        return Text("Failed To load Tasks");
      }, (tasks){
       return MainScreenStream(alltasks : tasks);
      }),
     )); 
    }
  
}