import 'package:flutter/material.dart';
import 'dart:math';
import 'items_randomizer.dart';

class CasinoSkeleton extends StatefulWidget {
  const CasinoSkeleton({super.key, required this.title});

  final String title;

  @override
  State<CasinoSkeleton> createState() => _CasinoSkeletonState();
}

class _CasinoSkeletonState extends State<CasinoSkeleton> {
  List<String> listImage = [
    "images/bar.png",
    "images/cerise.png",
    "images/cloche.png",
    "images/diamant.png",
    "images/fer-a-cheval.png",
    "images/pasteque.png",
    "images/sept.png"
  ];
  List<int> indexWheel = [0, 1, 2];
  late String a;
  late String b;
  late String c;
  String message = '';
  bool isWin = false;
  bool isJackpot = false;

  @override
  void initState() {
    a = listImage[indexWheel[0]];
    b = listImage[indexWheel[1]];
    c = listImage[indexWheel[2]];
    super.initState();
  }

  void _onPlay() {
    setState(() {
      indexWheel.clear();
      for (var i = 0; i < 3; i++) {
        Random r = Random();
        indexWheel.add(r.nextInt(listImage.length));
      }
      a = listImage[indexWheel[0]];
      b = listImage[indexWheel[1]];
      c = listImage[indexWheel[2]];

      if (indexWheel[0] == indexWheel[1] && indexWheel[2] == indexWheel[1]) {
        isWin = true;
        message = "Jackpot";
        if (indexWheel[0] == 6) {
          isJackpot = true;
          message = "Méga Jackpot !!!";
        }
      } else {
        message = "You loose ! Try again";
      }
      isJackpot = false;
      isWin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: Image(image: AssetImage(a)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: Image(image: AssetImage(b)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  child: Image(image: AssetImage(c)),
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: _onPlay, child: const Icon(Icons.play_arrow)),
          Container(
            child: Text(message),
          )
        ]));
  }
}
