import 'dart:io';
import 'dart:async';

Future<void> main() async {
  //transforming a stream

  final file = File(
      'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  final stream = file.openRead();
  stream.listen(
    (data) {
      print(data);
    },
  );
}  


//reading text from a single file 
  // final file = File(
  //     'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  // final contents = await file.readAsString();
  // print(contents);
