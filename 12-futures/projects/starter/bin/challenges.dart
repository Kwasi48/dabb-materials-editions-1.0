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
  Future<double> fetchTemperature(String city) {
    // TODO: implement fetchTemperature
    throw UnimplementedError();
  }
}
