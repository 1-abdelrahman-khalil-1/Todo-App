import 'package:get_it/get_it.dart';
import 'package:to_do/Core/Services/database_service.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo.dart';
import 'package:to_do/Features/Main%20Screen/data/repo/todo_repo_impl.dart';

GetIt get_it = GetIt.asNewInstance();
void setup_get_it(){
  get_it.registerSingleton<DatabaseService>(DatabaseService());
  get_it.registerSingleton<TodoRepo>(TodoRepoImpl(databaseService: get_it<DatabaseService>()));
}