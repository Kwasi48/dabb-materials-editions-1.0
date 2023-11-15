//challenge 1
import 'dart:isolate';

Future<void> main() async {
  final receivePort = ReceivePort();
  int n = 10;
  final arguments = {'n': n, 'sendPort': receivePort.sendPort};

  await Isolate.spawn(fibonacci, arguments);
  final message = await receivePort.first as int;
  print('the fibonacci number of $n is $message');
}

void fibonacci(Map<String, Object> arguments) {
  final sendPort = arguments['sendPort'] as SendPort;
  final n = arguments['n'] as int;
  var current = 1;
  var previous = 1;
  var done = 2;
  while (done < n) {
    final next = current + previous;
    previous = current;
    current = next;
    done += 1;
  }
  Isolate.exit(sendPort, current);
}
