import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  //challenge 1
  final url = Uri.parse('https://kodeco.com');
  final client = http.Client();
  final request = http.Request('GET', url);
  final response = await client.send(request);
  final stream = response.stream;

  // stream.listen((value) {
  //   print(value);
  // });

  try {
    final contents = stream.transform(utf8.decoder);
    await for (var con in contents) {
      print(con.length);
    }
  } on Exception catch (e) {
    print(e);
  } finally {
    client.close();
  }
}
