enum Day {
  monday,
  tuesday,
  wednesday,
  thurday,
  friday,
  saturday,
  sunday;

  //final String displayName = Day.values.toString().toUpperCase();

  Day operator +(int days) {
    //1
    final numberOfItems = Day.values.length;
    //2
    final index = (this.index + days) % numberOfItems;
    //3
    return Day.values[index];
  }

  Day get next {
    return this + 1;
  }

  //Challenge 2
  String get displayName {
    return Day.values[index].name.toString().toUpperCase();
  }

  //Challenge 1
  Day operator -(int days) {
    final numberOfDays = Day.values.length;
    final index = (this.index - days) % numberOfDays;
    return Day.values[index];
  }
}

enum TrafficLight {
  green('Go'),
  yellow('Slow Down'),
  red('Stop!');

  const TrafficLight(this.message);
  final String message;
}

void main() {
  final color = TrafficLight.green;
  print(color.message);
  // final color = Trafficlight.green;
  // switch (color) {
  //   case Trafficlight.green:
  //     print('Go');
  //     break;
  //   case Trafficlight.yellow:
  //     print('Slow Down');
  //     break;
  //   case Trafficlight.red:
  //     print('Stop');
  //     break;
  // }

  final restDay = Day.saturday;
  print(restDay.next);
  print(restDay.displayName);

  var day = Day.monday;
  day = day - 2;
  print(day.name);

  const PointA = Point(1, 4);
  const PointB = Point(3, 2);
  final pointC = PointA + PointB;
  print(pointC);
}

class Point {
  const Point(this.x, this.y);
  final double y;
  final double x;

  @override
  String toString() => '($x, $y)';

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }
}
