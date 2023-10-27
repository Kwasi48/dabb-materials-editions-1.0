Future<void> main() async {
  print('Before the future');

  final value = await Future<int>.delayed(Duration(seconds: 1), (() => 42));
  print('Value: $value');
  print('After the Future');
}


//  print('Before the future');

//   final myFuture = Future<int>.delayed(Duration(seconds: 1), (() => 42))
//       .then((value) => print('Value: $value'))
//       .catchError((Object error) => print('Error: $error'))
//       .whenComplete(() => print('Future is complete'));

//   print('After the Future');