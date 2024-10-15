import 'package:flutter/material.dart';

class ItemsRandomize extends StatefulWidget {
  const ItemsRandomize({super.key, required this.title});
  final String title;

  @override
  State<ItemsRandomize> createState() => _ItemsRandomizeState();
}

class _ItemsRandomizeState extends State<ItemsRandomize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListWheelScrollView(
      itemExtent: 100,
      children: const <Widget>[
        Image(image: AssetImage('assets/bar.png')),
        Image(image: AssetImage('assets/cerise.png')),
        Image(image: AssetImage('assets/cloche.png')),
        Image(image: AssetImage('assets/diamant.png')),
        Image(image: AssetImage('assets/bar.png')),
      ],
    ));
  }
}
