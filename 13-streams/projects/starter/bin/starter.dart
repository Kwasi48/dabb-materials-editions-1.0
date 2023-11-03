import 'dart:io';

Future<void> main() async {
  //Using try catch to handle errors
  try {
    final file = File(
        'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text_long.txt');
    final stream = file.openRead();
    await for (var data in stream) {
      print(data.length);
    }
  } on Exception catch (e) {
    print(e);
  } finally {
    print("all finished");
  }
}


//reading text from a single file 
  // final file = File(
  //     'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  // final contents = await file.readAsString();
  // print(contents);
