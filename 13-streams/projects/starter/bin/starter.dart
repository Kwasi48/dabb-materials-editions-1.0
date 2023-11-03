import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  // decoding the bytes

  final file = File(
      'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  final byteStream = file.openRead();
  final stringStream = byteStream.transform(utf8.decoder);
  await for (var data in stringStream) {
    print(data);
  }
}  


//reading text from a single file 
  // final file = File(
  //     'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  // final contents = await file.readAsString();
  // print(contents);


 //transforming a stream

//   final file = File(
//       'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
//   final stream = file.openRead();
//   stream.listen(
//     (data) {
//       print(data);
//     },
//   );
// }  