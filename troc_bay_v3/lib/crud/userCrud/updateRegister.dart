import '../../model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateRegister {
  static Future<http.Response> upRegister(User user) async {
    var data = {
      "id": user.id,
      "pseudo": user.pseudo,
      "email": user.email,
      "pass": user.pass,
      "lastName": user.lastName,
      "firstName": user.firstName,
      "localisation": user.localisation,
    };
    String body = jsonEncode(data);

    http.Response response = await http.post(
      Uri.parse('http://trocbay2.000webhostapp.com/api/post/update.php'),
      // headers: {"Content-Type": "application/json"},
      body: body,
    );
    print(body);
    // print(user.email);
    return response;
  }
}
