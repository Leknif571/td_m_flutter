import 'package:flutter/material.dart';
import '../crud/userCrud/login.dart';
import 'navBar.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _userMail = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/bg.jpg'))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _userMailInput(),
              const SizedBox(
                height: 25,
              ),
              _passwordInput(),
              const SizedBox(
                height: 25,
              ),
              _button()
            ]),
      ),
    );
  }

  Widget _userMailInput() {
    return Flexible(
        flex: 2,
        child: TextFormField(
          controller: _userMail,
          obscureText: false,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            border: OutlineInputBorder(),
            labelText: 'Pseudo/Email',
          ),
        ));
  }

  Widget _passwordInput() {
    return Flexible(
        flex: 2,
        child: TextFormField(
          controller: _password,
          obscureText: true,
          validator: passValidator,
          decoration: const InputDecoration(
            icon: Icon(Icons.password),
            labelText: 'Mot de passe',
            border: OutlineInputBorder(),
          ),
        ));
  }

  Widget _button() {
    return Flexible(
      flex: 2,
      child: ElevatedButton(
        onPressed: onConnect,
        child: const Text('Valider'),
      ),
    );
  }

  onConnect() async {
    Future<Map<String, dynamic>> login;
    login = Login.verifConnect(_userMail.text, _password.text);

    Map<String, dynamic> log = {};

    await login.then((value) => {
          if (value != null) {log.addAll(value)}
        });

    print(log);

    if (log["flag"] == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NavPage(currUser: login)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(log["message"])),
      );
    }

    // Login.verifConnect(_userMail.text, _password.text).then((value) {
    //   print(value['email']);
    // });
    return null;
  }

  String? passValidator(v) {
    return null;
  }
}
