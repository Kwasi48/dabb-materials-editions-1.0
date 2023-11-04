//Using Asynchronous generators
Stream<String> consciousness() async* {
  final data = ['con', 'sciuos', 'ness'];
  for (final part in data) {
    await Future<void>.delayed(Duration(milliseconds: 500));
    yield part;
  }
}

Future<void> main() async {
  final first = Future(() => 'Row');
  final second = Future(() => 'row');
  final third = Future(() => 'row');
  final fourth =
      Future.delayed(Duration(milliseconds: 300), (() => 'your boat'));

  final stream = Stream<String>.fromFutures([
    first,
    second,
    third,
    fourth,
  ]);

  stream.listen((event) {
    print(event);
  });

  final stream1 = consciousness();

  stream1.listen((event) {
    print(event);
  });
}
