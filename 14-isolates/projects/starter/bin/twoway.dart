import 'dart:io';

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
