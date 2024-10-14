import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:troc_bay_v3/page/connexion.dart';
import 'package:troc_bay_v3/page/updateProfile.dart';
import '../crud/userCrud/delete.dart';

class SettingsUser extends StatefulWidget {
  const SettingsUser({Key? key, required this.currUser}) : super(key: key);
  final Future<Map<String, dynamic>> currUser;

  @override
  State<SettingsUser> createState() => _SettingUserState();
}

class _SettingUserState extends State<SettingsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Votre compte'),
          backgroundColor: Colors.black,
          toolbarHeight: 63,
        ),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Column(children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
              const SizedBox(height: 30),
              Text(email1().toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(userIdCurr().toString()),
                  Text(email1().toString())
                ],
              ),
              Text(email1().toString()),
              Text(email1().toString()),
              ElevatedButton(
                  onPressed: () => onGoUpdate(),
                  child: const Text('Editer profil')),
              ElevatedButton(
                  onPressed: () => onDelete(),
                  child: const Text('Supprimer mon compte !'))
            ]))));
  }

  onGoUpdate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const updateP()));
  }

  onDelete() {
    Future<String> del = Delete.deleteU(userCurrV);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LogInPage(title: "title")));
  }

  int email = 0;
  String nom = '';
  String prenom = '';

  userCurr() async {
    await widget.currUser.then((value) {
      email = int.parse(value["id"]);
    });
    // print(email);
    return email;
  }

  int email1() {
    // print(email);
    userCurr();
    // print(email);
    // print(userCurrV.runtimeType);
    return email;
  }

  int userCurrV = 0;

  userCurr1() async {
    await widget.currUser.then((value) {
      userCurrV = int.parse(value["id"]);
    });
    return userCurrV;
  }

  int userIdCurr() {
    print(userCurrV);
    userCurr1();
    print(userCurrV);
    return userCurrV;
  }
}
