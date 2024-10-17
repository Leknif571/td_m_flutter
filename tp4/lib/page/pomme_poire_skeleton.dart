import 'package:flutter/material.dart';
import '../model/enum/enum_typenb.dart';
import '../logic_metier/pomme_poire_logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final int _counter;
  late PommePoireLogic ppLogic;

  //Piste d'amélioration pour plus tard, créer un modèle fruit qui contient 1 image + 1 chiffre.
  //Ou alors une Map fruit qui contient le path vers l'image + un chiffre <int, String>

  final List<int> _fruits = [];
  final List<String> _logo = [];

  final Map<TypeNombre, String?> _fruitImagePath = {
    TypeNombre.premier: "images/ananas.png",
    TypeNombre.pair: "images/poire.png",
    TypeNombre.impair: "images/pomme.png"
  };

  @override
  void initState() {
    _counter = 0;
    ppLogic = PommePoireLogic(_counter, _fruits, _logo, _fruitImagePath);
    super.initState();
  }

  void onPressed() {
    setState(() {
      ppLogic.onPressed();
    });
  }

  void onRemoved(int i) {
    setState(() {
      ppLogic.onRemoved(i);
    });
  }

  void _getModal(int index) {
    setState(() {
      _showModal(index);
    });
  }

  Future<void> _showModal(int i) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(ppLogic.displayBar(ppLogic.fruits[i])!),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image(image: AssetImage(ppLogic.logo[i])),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onRemoved(i);
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.delete),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
            child: Text(ppLogic.displayBar(ppLogic.counter) ?? widget.title)),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: ppLogic.fruits.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Center(
                  child: Text(
                'Chiffre: ${ppLogic.fruits[index]}',
                style: const TextStyle(color: Colors.white),
              )),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage(ppLogic.logo[index])),
              ),
              tileColor: ppLogic.color(ppLogic.fruits[index]),
              onTap: () {
                _getModal(index);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: "add number",
        backgroundColor: ppLogic.color(ppLogic.counter),
        child: const Icon(Icons.add),
      ),
    );
  }
}
