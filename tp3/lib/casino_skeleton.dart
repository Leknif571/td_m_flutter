import 'package:flutter/material.dart';
import 'items_randomizer.dart';

class CasinoSkeleton extends StatefulWidget {
  const CasinoSkeleton({super.key, required this.title});
  final String title;

  @override
  State<CasinoSkeleton> createState() => _CasinoSkeletonState();
}

class _CasinoSkeletonState extends State<CasinoSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ItemsRandomize(title: "title")]));
  }
}
