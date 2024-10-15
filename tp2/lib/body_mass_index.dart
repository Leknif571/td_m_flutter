import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BodyMassIndex extends StatefulWidget {
  const BodyMassIndex({super.key, required this.title});

  final String title;

  @override
  State<BodyMassIndex> createState() => _BodyMassIndexState();
}

class _BodyMassIndexState extends State<BodyMassIndex> {
  final _tailleField = GlobalKey<FormState>();
  final _poidsField = GlobalKey<FormState>();
  final _taille = TextEditingController();
  final _poids = TextEditingController();

  double imc = 0;
  String imcString = '';
  bool isTrue = false;
  String imcCategory = '';

  void _calculeImc() {
    setState(() {
      if (_poidsField.currentState!.validate() ||
          _tailleField.currentState!.validate()) {
        imc = double.parse(_poids.text) /
            ((double.parse(_taille.text) / 100) *
                (double.parse(_taille.text) / 100));
        imcString = imc.toInt().toString();

        if (imc > 18.5 && imc < 25) {
          imcCategory = "Normal";
        } else if (imc > 25 && imc < 30) {
          imcCategory = "Surpoids";
        } else if (imc > 30 && imc < 35) {
          imcCategory = "Obèse";
        } else if (imc > 35) {
          imcCategory = "Obèse morbide";
        } else if (imc < 18.5) {
          imcCategory = "Anorxie";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: _poidsField,
                controller: _poids,
                // validator: imcValidator,
                decoration: const InputDecoration(
                  labelText: 'Poids',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: _tailleField,
                controller: _taille,
                validator: (String? v) {
                  RegExp reg = RegExp(r'^[0-9]*$');
                  if (reg.allMatches(v!).length != 1) {
                    return 'Utiliser uniquement des nombres';
                  } else if (v.length > 3) {
                    return 'Uniquement 3 chiffres';
                  }
                  return null;
                },
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
                Text(imcCategory)
              ],
            ),
            // Center(child: _getRadialGauge(imc, imcString))
          ],
        ),
      ),
    );
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
