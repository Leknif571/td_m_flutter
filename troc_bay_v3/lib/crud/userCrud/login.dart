import 'dart:convert';
import 'package:http/http.dart' as http;

class Login {
  static Future<Map<String, dynamic>> verifConnect(
      String emailOrUser, String pass) async {
    var data = {"email": emailOrUser, "pass": pass};

    String body = jsonEncode(data);

    http.Response response = await http.post(
      Uri.parse(
          'http://trocbay2.000webhostapp.com/api/post/getByPassEmail.php'),
      // headers: {"Content-Type": "application/json"},
      body: body,
    );

    final Map<String, dynamic> currentUser = jsonDecode(response.body)[0];
    print(currentUser["flag"]);

    return currentUser;
  }
}
