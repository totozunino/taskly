import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final bool completed;

  Todo({
    required this.text,
    required this.createdAt,
    required this.completed,
  });
}
