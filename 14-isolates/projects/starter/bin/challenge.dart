//challenge 1
import 'dart:isolate';

Future<void> main() async {}

void fibonacci(Map<String, Object> arguments) {
  final sendPort = arguments['sendPort'] as SendPort;
  final n = arguments['n'] as int;
  var current = 1;
  var previous = 1;
  var done = 2;
  while (done < 2) {
    final current = current + previous;
    previous = current;
    current = next;
    done++;
  }
  Isolate.exit(sendPort, current);
}
