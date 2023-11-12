import 'dart:isolate';

void playHideandSeekTheLongVersion(SendPort sendPort) {
  var counting = 0;
  for (var i = 1; i <= 1000000000; i++) {
    counting = i;
  }
  final message = '$counting! Ready or not, here I come';
  Isolate.exit(sendPort, message);
}

Future<void> main() async {
  //1
  final receivePort = ReceivePort();

  //2
  await Isolate.spawn<SendPort>(
    //3
    playHideandSeekTheLongVersion,

    //4
    receivePort.sendPort,
  );

  //5
  final message = await receivePort.first as String;
  print(message);
}
