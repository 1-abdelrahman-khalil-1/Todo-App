
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'database_service.g.dart';
class TodoItems extends Table{
IntColumn get id => integer().autoIncrement()();
TextColumn get taskname => text()();
IntColumn get date => integer()();
BoolColumn get completed => boolean().withDefault(Constant(false))();
}

@DriftDatabase(tables: [TodoItems])
class DatabaseService extends _$DatabaseService{
  DatabaseService():super(_openConnection());

  @override
  int get schemaVersion => 1;
}
QueryExecutor _openConnection() {
  return driftDatabase(
      name: 'todo',
      native: const DriftNativeOptions( ),
    );
}