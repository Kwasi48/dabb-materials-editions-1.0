abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) async {
    //return Future(() => 42);\
    //completing with a value
    //return Future.value(42);
    //completing with an error
    //return Future.error(ArgumentError("$city doesn't exist"));
    //Giving a Delayed Response with error
    return Future.delayed(Duration(seconds: 2),
        (() => throw ArgumentError('City does not exist')));
  }
}

Future<void> main() async {
  final server = FakeWebServer();
  print(server.fetchTemperature('havanna'));
}
