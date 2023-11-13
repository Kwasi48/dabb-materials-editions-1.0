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
Future<void> _entryPoint(SendPort sendToEarthPort) async {
  //2
  final receiveOnMarsPort = ReceivePort();
  sendToEarthPort.send(receiveOnMarsPort.sendPort);
  //3
  final work = Work();

  //TODO: add listener
}
