import 'dart:io';
import 'dart:async';

Future<void> main() async {
  //Cancelling a Stream

  final file = File(
      'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text_long.txt');
  final stream = file.openRead();
  StreamSubscription<List<int>>? subscription;
  subscription = stream.listen(
    (data) {
      print(data.length);
      subscription?.cancel();
    },
    cancelOnError: true,
    onDone: () {
      print('all finished');
    },
  );
}  


//reading text from a single file 
  // final file = File(
  //     'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  // final contents = await file.readAsString();
  // print(contents);
