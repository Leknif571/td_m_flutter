import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tp3/logic_metier/casino_logic.dart';

import 'package:tp3/model/model_casino_result.dart';
import 'package:tp3/model/model_casino_table_return.dart';

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
  final _ctrll = ConfettiController();
  late ModelCasino casino;
  late ModelCasinoTableReturn allMap;

  @override
  void initState() {
    casino = ModelCasino("", false, false);
    allMap = ModelCasinoTableReturn(
        {0: listImage[0], 1: listImage[0], 2: listImage[0]}, listImage);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _ctrll.dispose();
  }

  void _onPlay() {
    setState(() {
      Map<int, String?> randomImage = CasinoLogic().returnTable(listImage);
      allMap = ModelCasinoTableReturn(randomImage, listImage);
      casino = CasinoLogic().onPlay(allMap);
      casino.isJackpot ? _ctrll.play() : _ctrll.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text(widget.title)),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/wood.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: Image(image: AssetImage(allMap.resultRandom[0]!)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: Image(image: AssetImage(allMap.resultRandom[1]!)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: Image(image: AssetImage(allMap.resultRandom[2]!)),
                    ),
                  )
                ],
              ),
              ConfettiWidget(
                confettiController: _ctrll,
                blastDirection: -pi / 2,
                numberOfParticles: 150,
                gravity: 0.08,
              ),
              ElevatedButton(
                  onPressed: _onPlay, child: const Icon(Icons.play_arrow)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(casino.message,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFED4B))),
              ),
            ])));
  }
}
