// enum Trafficlight {
//   green,
//   yellow,
//   red,
// }

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
