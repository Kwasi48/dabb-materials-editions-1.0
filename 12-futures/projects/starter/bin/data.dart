import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Todo {
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> jsonMap) {
    return Todo(
        userId: jsonMap['userId'] as int,
        id: jsonMap['id'] as int,
        title: jsonMap['title'] as String,
        completed: jsonMap['completed'] as bool);
  }

  final int userId;
  final int id;
  final String title;
  final bool completed;

  @override
  String toString() {
    return 'userId: $userId\n'
        'id: $id'
        'title: $title'
        'completed: $completed';
  }
}
