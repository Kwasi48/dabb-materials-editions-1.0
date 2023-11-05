import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final url = Uri.parse('https://kodeco.com');
  final client = http.Client();
  final request = http.Request('GET', url);
  final response = await client.send(request);
  final stream = response.stream;

  // stream.listen((value) {
  //   print(value);
  // });

  final contents = stream.transform(utf8.decoder);
  await for (var con in contents) {
    print(con);
  }
}
