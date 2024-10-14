import 'package:flutter/material.dart';

class Discussion extends StatefulWidget {
  const Discussion({Key? key}) : super(key: key);
  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre compte'),
        backgroundColor: Colors.black,
        toolbarHeight: 63,
      ),
      body: const Center(
        child: Text('En cours de développement'),
      ),
    );
  }
}
