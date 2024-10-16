import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BodyMassIndex extends StatefulWidget {
  const BodyMassIndex({super.key, required this.title});

  final String title;

  @override
  State<BodyMassIndex> createState() => _BodyMassIndexState();
}

class _BodyMassIndexState extends State<BodyMassIndex> {
  final _formImc = GlobalKey<FormState>();
  final _taille = TextEditingController();
  final _poids = TextEditingController();

  late String category;
  late double imc;

  @override
  void initState() {
    category = "normal";
    imc = 0;
    super.initState();
  }

  void _calculeImc() {
    setState(() {
      if (_formImc.currentState!.validate()) {
        imc = double.parse(_poids.text) /
            ((double.parse(_taille.text) / 100) *
                (double.parse(_taille.text) / 100));

        switch (imc) {
          case var v when (v < 18.5):
            returnCategory("Anorexie");
            break;
          case var v when (v >= 18.5 && v < 25):
            returnCategory("Normal");
            break;
          case var v when (v >= 25 && v < 30):
            returnCategory("Surpoids");
            break;
          case var v when (v >= 30 && v < 35):
            returnCategory("Obèse");
            break;
          case var v when (v >= 35):
            returnCategory("Obèse morbide");
            break;
          default:
            returnCategory("Valeur inconnue");
        }
      }
    });
  }

  /* On aurait pu directement formatter l'affichage en enlevant le widget Row et 
    Text pour n'avoir que ça : 
    ***Controlleur***
    String returnCategory(String v) {
        return category = "Vous êtes $v";
    }
    ***Vue***
        ...
          Text(category)
        ...  
    */

  String returnCategory(String v) {
    return category = v;
  }

  String? _inputValidator(v) {
    RegExp reg = RegExp(r'^[0-9]*$');
    if (v == null || v.isEmpty) {
      return 'Champs obligatoire';
    } else if (reg.allMatches(v).length != 1) {
      return 'Utiliser uniquement des nombres';
    } else if (v.length > 3) {
      return 'Uniquement 3 chiffres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Form(
          key: _formImc,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const Key("_poidsField"),
                    controller: _poids,
                    validator: _inputValidator,
                    decoration: const InputDecoration(
                      labelText: 'Poids',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const Key("_tailleField"),
                    controller: _taille,
                    validator: _inputValidator,
                    decoration: const InputDecoration(
                      labelText: 'Taille',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: _calculeImc, child: const Icon(Icons.verified)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vous êtes:',
                    ),
                    Text(category)
                  ],
                ),
                Center(child: _getRadialGauge(imc, imc.toInt().toString()))
              ],
            ),
          ),
        ));
  }
}

Widget _getRadialGauge(double imc, String imcString) {
  return SfRadialGauge(axes: <RadialAxis>[
    RadialAxis(minimum: 0, maximum: 45, ranges: <GaugeRange>[
      GaugeRange(
          startValue: 0,
          endValue: 18,
          color: Colors.green,
          startWidth: 10,
          endWidth: 10),
      GaugeRange(
          startValue: 18,
          endValue: 25,
          color: Colors.yellow,
          startWidth: 10,
          endWidth: 10),
      GaugeRange(
          startValue: 25,
          endValue: 35,
          color: Colors.orange,
          startWidth: 10,
          endWidth: 10),
      GaugeRange(
          startValue: 35,
          endValue: 45,
          color: Colors.red,
          startWidth: 10,
          endWidth: 10)
    ], pointers: <GaugePointer>[
      NeedlePointer(value: imc)
    ], annotations: <GaugeAnnotation>[
      GaugeAnnotation(
          widget: Text(imcString,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          angle: 90,
          positionFactor: 0.5)
    ])
  ]);
}
