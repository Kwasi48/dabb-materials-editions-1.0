//spotty Internet
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

Future<void> checkTemperature(DataRepository repo) async {
  try {
    final city = 'Portland';
    final degrees = await repo.fetchTemperature(city);
    print("It's $degrees degress in $city");
  } on HttpException catch (e) {
    print(e);
  }
}

class FakeWebServer implements DataRepository {
  //using the completer class
  @override
  Future<double> fetchTemperature(String city) {
    var random = Random();
    final errorvalue = random.nextBool();
    if (errorvalue) {
      return Future.error(HttpException("couldn't reach the server"));
    } else {
      final temp = random.nextDouble() * 50;
      return Future.value(temp);
    }
  }
}

class realData implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) async {
    return Future(() => 24.0);
  }
}

Future<void> main() async {
  String url = 'https://fcc-weather-api.glitch.me/api/current';
  const longitiude = 12.0;
  const latitude = 145.8;
  final parsedUrl = Uri.parse('$url?lat=$latitude&lon=$longitiude');
  try {
    final response = await http.get(parsedUrl);
    final statusCode = response.statusCode;
    if (statusCode != 200) {
      throw HttpException('$statusCode');
    }

    final jsonString = response.body;
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    print(jsonMap);
    final temp = jsonMap['main']['temp'] as double;
    final name = jsonMap['name'] as String;
    print("it is $temp degress in $name");
  } on SocketException catch (e) {
    print(e);
  } on FormatException catch (e) {
    print(e);
  } on HttpException catch (e) {
    print(e);
  }
}

class Comment {
  int id;
  int postId;
  String name;
  String email;
  String body;

  Comment(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory Comment.fromJson(Map<String, dynamic> jsonMap) {
    return Comment(
      postId: jsonMap['postId'] as int,
      id: jsonMap['id'] as int,
      name: jsonMap['name'] as String,
      email: jsonMap['email'] as String,
      body: jsonMap['body'] as String,
    );
  }

  @override
  String toString() {
    return '$name\n $body';
  }
}
