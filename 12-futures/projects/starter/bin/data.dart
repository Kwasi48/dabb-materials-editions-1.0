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
        'id: $id\n'
        'title: $title\n'
        'completed: $completed';
  }
}

Future<void> main() async {
  //1
  try {
    final url = 'https://jsonplaceholder.typicode.com/todos/1';
    final parsedUrl = Uri.parse(url);
    //2,3
    final response = await http.get(parsedUrl);
    //4
    final statusCode = response.statusCode;
    if (statusCode != 200) {
      throw HttpException('$statusCode');
    }
    //5
    final jsonString = response.body;
    dynamic jsonMap = jsonDecode(jsonString);
    //6
    final todo = Todo.fromJson(jsonMap);
    print(todo);
  } on SocketException catch (e) {
    print(e);
  } on HttpException catch (e) {
    print(e);
  } on FormatException catch (e) {
    print(e);
  }
}
