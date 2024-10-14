import 'dart:convert';
import 'package:http/http.dart' as http;

class TrocByUser {
  static Future<List<dynamic>> allTrocsByUser(int id) async {
    var data = {
      "idUser": id,
    };
    String body = jsonEncode(data);

    http.Response response = await http.post(
      Uri.parse('http://trocbay2.000webhostapp.com/api/post/getAllByUser.php'),
      // headers: {"Content-Type": "application/json"},
      body: body,
    );

    List<dynamic> all = jsonDecode(response.body);
    print(all);

    return all;
  }
}
