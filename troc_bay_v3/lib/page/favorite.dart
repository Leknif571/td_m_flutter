import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key, required this.currUser}) : super(key: key);
  final Future<Map<String, dynamic>> currUser;
  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Votre compte'),
      backgroundColor: Colors.black,
      toolbarHeight: 63,
    ));
  }
}
