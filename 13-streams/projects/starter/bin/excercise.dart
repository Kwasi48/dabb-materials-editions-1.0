import 'dart:io';

Future<void> main() async {
  //The following code produces a stream that outputs an integer every second and stops after
  //the tenth time.
  //1. Set the stream above to a variable named myStream .
  //2. Use await for to print the value of the integer on each data event coming from the stream.

  final file = File(
      'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  final byteStream = file.openRead();
  final myStream =
      Stream<int>.periodic(Duration(seconds: 1), (value) => value).take(10);
  await for (var data in myStream) {
    print(data);
  }
}
