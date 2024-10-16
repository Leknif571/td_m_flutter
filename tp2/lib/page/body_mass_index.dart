import 'package:flutter/material.dart';
import '../widget/circular_counter_widget.dart';
import '../widget/input_element.dart';
import '../logic_metier/body_mass_index_logic.dart'; // Importer la logique métier

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

  final BodyMassIndexLogic _bodyMassLogic =
      BodyMassIndexLogic(); // Instance de la logique

  @override
  void initState() {
    category = "";
    imc = 0;
    super.initState();
  }

  void _calculeImc() {
    setState(() {
      if (_formImc.currentState!.validate()) {
        imc = _bodyMassLogic.calculateImc(
            double.parse(_poids.text), double.parse(_taille.text));
        category = _bodyMassLogic.getCategory(imc); // Utilise la logique métier
      }
    });
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
                InputPoids(poids: _poids, bodyMassLogic: _bodyMassLogic),
                InputTaille(taille: _taille, bodyMassLogic: _bodyMassLogic),
                ElevatedButton(
                    onPressed: _calculeImc, child: const Icon(Icons.verified)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vous êtes: ',
                    ),
                    Text(category)
                  ],
                ),
                Center(child: CircularCounter(imc: imc))
              ],
            ),
          ),
        ));
  }
}
