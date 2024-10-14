import 'dart:convert';
import 'package:http/http.dart' as http;

class Delete {
  static Future<String> deleteU(int idU) async {
    var data = {
      "id": idU,
    };
    String body = jsonEncode(data);

    http.Response response = await http.post(
      Uri.parse('http://trocbay2.000webhostapp.com/api/post/deleteU.php'),
      // headers: {"Content-Type": "application/json"},
      body: body,
    );

    final String message = jsonDecode(response.body)[0];
    print(message);

    return message;
  }
}
