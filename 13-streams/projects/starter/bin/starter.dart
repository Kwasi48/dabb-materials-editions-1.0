import 'dart:io';

Future<void> main() async {
  final file = File(
      'C:/Users/micha/OneDrive/Desktop/books/dabb-materials-editions-1.0/13-streams/projects/starter/assets/text.txt');
  final contents = await file.readAsString();
  print(contents);
}
