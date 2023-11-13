import 'dart:io';
import 'dart:isolate';
import 'dart:web_gl';

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

//1
Future<void> _entryPoint(SendPort sendToEarthPort) async {
  //2
  final receiveOnMarsPort = ReceivePort();
  sendToEarthPort.send(receiveOnMarsPort.sendPort);
  //3
  final work = Work();

  receiveOnMarsPort.listen((Object? messageFromEarth) async {
    //1
    await Future<void>.delayed(Duration(seconds: 1));
    print('Message from Earth: $messageFromEarth');
    //2
    if (messageFromEarth == 'Hey from Earth') {
      sendToEarthPort.send('Hey from Mars');
    } else if (messageFromEarth == 'Can you help?') {
      sendToEarthPort.send('sure');
    }
    //3
    else if (messageFromEarth == 'doSomething') {
      final result = await work.doSomething();
      //4
      sendToEarthPort.send({
        'method': 'doSomething',
        'result': result,
      });
      sendToEarthPort.send('done');
    }
  });
}
