import 'package:flutter/material.dart';
import 'package:troc_bay_v3/model/user.dart';
import 'package:troc_bay_v3/page/newTroc.dart';
import '../crud/trocCrud/allTrocsByUser.dart';

class ListTroc extends StatefulWidget {
  ListTroc({Key? key, required this.currUser}) : super(key: key);
  final Future<Map<String, dynamic>> currUser;
  @override
  State<ListTroc> createState() => _ListTrocState();
}

class _ListTrocState extends State<ListTroc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Votre compte'),
          backgroundColor: Colors.black,
          toolbarHeight: 63,
        ),
        body: Container(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
          ),
          ElevatedButton(
            child: Text('Ajouter'),
            onPressed: () {
              onGoNew();
            },
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: TrocByUser.allTrocsByUser(userIdCurr()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(snapshot.data![index]["label"]),
                      subtitle: Text(snapshot.data![index]["description"]),
                      contentPadding: EdgeInsets.only(bottom: 20.0),
                    ),
                  );
                  // Text(snapshot.data!.email);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          )
        ])));
  }

  onGoNew() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewTroc(id: userIdCurr())));
  }

  int userCurrV = 0;

  userCurr() async {
    await widget.currUser.then((value) {
      userCurrV = int.parse(value["id"]);
    });
    return userCurrV;
  }

  int userIdCurr() {
    print(userCurrV);
    userCurr();
    print(userCurrV);
    print(userCurrV.runtimeType);
    return userCurrV;
  }
}
