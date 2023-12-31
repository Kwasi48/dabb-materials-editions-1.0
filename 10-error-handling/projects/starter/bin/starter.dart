import 'dart:convert';

void main() {
  final database = FakeDatabase();
  database.open();

  try {
    final data = database.fetchData();
    final number = int.parse(data);
    print('The number is $number');
  } on FormatException {
    print("Dart didn't recognize that as a number");
  } finally {
    database.close();
  }
}

class FakeDatabase {
  void open() => print('Opening the database.');
  void close() => print('Closing the database');
  String fetchData() => '42';
}

void handleFormatException() {
  print('You tried to parse a non-numeric string.');
}

void handleDivisionByZero() {
  print("You can't divide by zero.");
}





 // final characters = ' abcdefghijklmnopqrstuvwxyz!';
  // final data = [4, 1, 18, 20, 0, 9, 19, 0, 6, 21, 14, 27];
  // final buffer = StringBuffer();
  // for (final index in data) {
  //   final letter = characters[index];
  //   buffer.write(letter);
  // }
  // print(buffer);

// //   const malformedJson = 'abc';
// //   jsonDecode(malformedJson);

//   functionOne();
// }

// void functionOne() {
//   functionTwo();
// }

// void functionTwo() {
//   functionThree();
// }

// void functionThree() {
//   int.parse('Hello');

// const json = ' abc';

//   try {
//     dynamic result = jsonDecode(json);
//     print(result);
//   } on FormatException {
//     print('The JSON string was invalid');
//   }

  // const numberStrings = ["42", "hello"];

  // try {
  //   for (final numberString in numberStrings) {
  //     final number = int.parse(numberString);
  //     print(number ~/ 0);
  //   }
  // } on FormatException {
  //   handleFormatException();
  // } on UnsupportedError {
  //   handleDivisionByZero();
  //}