import 'dart:io';

Future<void> main() async {
  //Using callback to handle errors
  final file = File(
      'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text_long.txt');
  final stream = file.openRead();
  stream.listen((data) {
    print(data.length);
  }, onError: (Object error) {
    print(error);
  }, onDone: () {
    print('All finished');
  });
}


//reading text from a single file 
  // final file = File(
  //     'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  // final contents = await file.readAsString();
  // print(contents);
