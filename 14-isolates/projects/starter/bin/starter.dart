import 'dart:isolate';

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
  //1
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn((message) { }, message)
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
