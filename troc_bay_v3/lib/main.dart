import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'page/inscription.dart';
import 'page/connexion.dart';

// import 'objet/user.dart';

// Future<List<dynamic>> fetchUser() async {
//   final response = await http.get(Uri.parse('http://localhost:8000/read.php'));

//   if (response.statusCode == 200) {
//     print(response.body);
//     // List<dynamic> body = [response.body];
//     return User.test(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load users');
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrocBay',
      theme: ThemeData(primaryColor: Colors.black),
      home: const ChoiceLogInRegister(),
    );
  }
}

//--------------------------

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// ----------------

// class _MyAppState extends State<MyApp> {
//   late Future<List<dynamic>> futureUser;

//   @override
//   void initState() {
//     super.initState();
//     futureUser = fetchUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<List<dynamic>>(
//             future: futureUser,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) => ListTile(
//                           title: Text(snapshot.data![index].pseudo),
//                           subtitle: Text(snapshot.data![index].email),
//                           contentPadding: EdgeInsets.only(bottom: 20.0),
//                         ));
//                 // Text(snapshot.data!.email);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class ChoiceLogInRegister extends StatelessWidget {
  const ChoiceLogInRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/bg.jpg'))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _connexionbutton(context),
              const SizedBox(height: 30),
              _registerbutton(context),
            ]),
      ),
    );
  }

  Widget _connexionbutton(context) {
    return Center(
        child: SizedBox(
            height: 90,
            width: 350,
            child: ElevatedButton(
                onPressed: () => onGoConnect(context),
                child: const Text("Connexion"))));
  }

  Widget _registerbutton(context) {
    return Center(
        child: SizedBox(
            height: 90,
            width: 350,
            child: ElevatedButton(
                onPressed: () => onGoRegister(context),
                child: const Text("Inscription"))));
  }

  onGoRegister(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'title')),
    );
  }

  onGoConnect(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LogInPage(
                  title: 'ras',
                )));
  }
}
