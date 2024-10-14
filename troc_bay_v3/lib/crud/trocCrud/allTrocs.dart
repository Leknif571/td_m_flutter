import 'dart:convert';
import 'package:http/http.dart' as http;

class allTrocs {
  static Future<List<dynamic>> allTrocsf() async {
    http.Response response = await http.post(
      Uri.parse('http://trocbay2.000webhostapp.com/api/post/getAllTrocs.php'),
      // headers: {"Content-Type": "application/json"},
    );

    List<dynamic> all = jsonDecode(response.body);
    print(all);

    return all;
  }
}
