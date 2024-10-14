import 'package:flutter/material.dart';
import 'settingsUser.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.currUser}) : super(key: key);
  final Future<Map<String, dynamic>> currUser;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Accueil'),
      backgroundColor: Colors.black,
      toolbarHeight: 63,
      actions: [
        Container(
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: onSettings,
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    )),
                const Text("Pseudo1"),
              ],
            ))
      ],
    ));
  }

  onSettings() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SettingsUser(
                  currUser: widget.currUser,
                )));
  }
}
