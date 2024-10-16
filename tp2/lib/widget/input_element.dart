import 'package:flutter/material.dart';
import '../logic_metier/body_mass_index_logic.dart';

class InputTaille extends StatelessWidget {
  const InputTaille({
    super.key,
    required TextEditingController taille,
    required BodyMassIndexLogic bodyMassLogic,
  })  : _taille = taille,
        _bodyMassLogic = bodyMassLogic;

  final TextEditingController _taille;
  final BodyMassIndexLogic _bodyMassLogic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: const Key("_tailleField"),
        controller: _taille,
        validator: (value) =>
            _bodyMassLogic.validateInput(value!), // Validation
        decoration: const InputDecoration(
          labelText: 'Taille',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class InputPoids extends StatelessWidget {
  const InputPoids({
    super.key,
    required TextEditingController poids,
    required BodyMassIndexLogic bodyMassLogic,
  })  : _poids = poids,
        _bodyMassLogic = bodyMassLogic;

  final TextEditingController _poids;
  final BodyMassIndexLogic _bodyMassLogic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: const Key("_poidsField"),
        controller: _poids,
        validator: (value) =>
            _bodyMassLogic.validateInput(value!), // Validation
        decoration: const InputDecoration(
          labelText: 'Poids',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
