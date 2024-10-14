import 'dart:convert';
import 'package:http/http.dart' as http;

class DeleteT {
  static Future<String> deleteTr(int idT) async {
    var data = {
      "id": idT,
    };
    String body = jsonEncode(data);

    http.Response response = await http.post(
      Uri.parse('http://trocbay2.000webhostapp.com/api/post/deleteT.php'),
      // headers: {"Content-Type": "application/json"},
      body: body,
    );

    final String message = jsonDecode(response.body)[0];
    print(message);

    return message;
  }
}
