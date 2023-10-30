import 'dart:async';

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  //using the completer class
  @override
  Future<double> fetchTemperature(String city) {
    //1
    final completer = Completer<double>();

    if (city == 'Portland') {
      //2
      completer.complete(42.0);
    } else {
      //3
      completer.completeError(ArgumentError("City doesn't exist"));
    }
    //4
    return completer.future;
  }
  // Future<double> fetchTemperature(String city) async {
  //   //return Future(() => 42);\
  //   //completing with a value
  //   //return Future.value(42);
  //   //completing with an error
  //   //return Future.error(ArgumentError("$city doesn't exist"));
  //   //Giving a Delayed Response with error
  //   // return Future.delayed(Duration(seconds: 2),
  //   //     (() => throw ArgumentError('City does not exist')));
  //   //using the async method
  //   return 42.0;
  // }
}

Future<void> main() async {
  final server = FakeWebServer();
  print(server.fetchTemperature('havanna'));
}
