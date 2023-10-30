//spotty Internet
import 'dart:async';

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  //using the completer class
  @override
  Future<double> fetchTemperature(String city) {}
}
