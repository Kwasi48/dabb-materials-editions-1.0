import 'dart:io';
import 'dart:isolate';

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
class Earth {
  //2
  final _receiveOnEarthPort = ReceivePort();
  SendPort? _sendToMarsPort;
  Isolate? _marsIsolate;

  Future<void> contactMars() async {
    if (_marsIsolate != null) return;
    _marsIsolate = await Isolate.spawn(
      _entryPoint,
      _receiveOnEarthPort.sendPort,
    );

    _receiveOnEarthPort.listen((Object? messageFromMars) async {
      await Future<void>.delayed(Duration(seconds: 1));
      print('Message from Mars: $messageFromMars');
      //1
      if (messageFromMars is SendPort) {
        _sendToMarsPort = messageFromMars;
        _sendToMarsPort?.send('Hey from Earth');
      }
      //2
      else if (messageFromMars == 'Hey from Mars') {
        _sendToMarsPort?.send('Can you hel?');
      } else if (messageFromMars == 'sure') {
        _sendToMarsPort?.send('doSomething');
        _sendToMarsPort?.send('doSomethingElse');
      }
      //3
      else if (messageFromMars is Map) {
        final method = messageFromMars['method'] as String;
        final result = messageFromMars['result'] as int;
        print('The result of $method is $result ');
      }
      //4
      else if (messageFromMars == 'done') {
        print('shutting down');
        dispose();
      }
    });
  }

  //3
  void dispose() {
    _receiveOnEarthPort.close();
    _marsIsolate?.kill();
    _marsIsolate = null;
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

Future<void> main() async {
  final earth = Earth();
  await earth.contactMars();
}
