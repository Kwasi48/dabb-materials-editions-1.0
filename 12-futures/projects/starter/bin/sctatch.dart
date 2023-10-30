abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) {
    //return Future(() => 42);
    return Future.value(42);
  }
}
