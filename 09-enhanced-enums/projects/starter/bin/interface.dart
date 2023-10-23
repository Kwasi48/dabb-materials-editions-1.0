abstract class Serializable {
  String serializable();
}

enum Weather implements Serializable {
  sunny,
  cloudy,
  rainy;

  @override
  String serializable() => name;

  static Weather deserialize(String value) {
    return values.firstWhere((element) => element.name == value,
        orElse: (() => Weather.sunny));
  }
}

enum Default<T extends Object> {
  font<String>('roboto'),
  size<double>(17.0),
  weight<int>(400);

  const Default(this.value);
  final T value;
}

void main() {
  final weather = Weather.cloudy;

  String serialized = weather.serializable();
  print(serialized);

  Weather deserialized = Weather.deserialize(serialized);
  print(deserialized);

  String defaultFont = Default.font.value;
  double defaultSize = Default.size.value;
  int defaultWeight = Default.weight.value;
}
