import 'dart:isolate';

void playHideandSeekTheLongVersion(SendPort sendPort) {
  // final sendPort = arguments[0] as SendPort;
  // final countTo = arguments[1] as int;

  sendPort.send("OK, I'am counting.......");

  var counting = 0;
  for (var i = 1; i <= 1000000000; i++) {
    counting = i;
  }

  sendPort.send('$counting! Ready or not, here I come');
  sendPort.send(null);
}

Future<void> main() async {
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn<SendPort>(
    playHideandSeekTheLongVersion,
    receivePort.sendPort,
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
