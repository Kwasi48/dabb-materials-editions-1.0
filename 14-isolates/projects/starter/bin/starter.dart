import 'dart:isolate';
import 'dart:io';

void playHideandSeekTheLongVersion(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final countTo = arguments[1] as int;

  sendPort.send("OK, I'am counting.......");

  var counting = 0;
  for (var i = 1; i <= countTo; i++) {
    counting = i;
  }

  sendPort.send('$counting! Ready or not, here I come');
  sendPort.send(null);
}

Future<void> main() async {
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn<List<Object>>(
    playHideandSeekTheLongVersion,
    [receivePort.sendPort, 9999999999],
  );

  receivePort.listen((Object? message) {
    if (message is String) {
      print(message);
    } else if (message == null) {
      receivePort.close();
      isolate.kill();
    }
  });
}

//   //2
//   await Isolate.spawn<SendPort>(
//     //3
//     playHideandSeekTheLongVersion,

//     //4
//     receivePort.sendPort,
//   );

//   //5
//   final message = await receivePort.first as String;
//   print(message);

class Work {
  Future<int> doSomething() async {
    print('do some work....');
    sleep(Duration(seconds: 1));
    return 42;
  }

  Future<int> doSomethingElse() async {
    print('doing somework.....');
    sleep(Duration(seconds: 1));
    return 24;
  }
}
