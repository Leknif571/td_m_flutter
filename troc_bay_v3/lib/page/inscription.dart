import 'package:flutter/material.dart';
import 'package:troc_bay_v3/page/connexion.dart';
import '../crud/userCrud/register.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _login = TextEditingController();
  final _lastName = TextEditingController();
  final _firstName = TextEditingController();
  final _password = TextEditingController();
  final _passwordVerif = TextEditingController();
  final _location = TextEditingController();
  var _currentIndex = 0;
  bool _attente = false;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Bar de titre en au de l'application (à modifier)
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/bg.jpg'))),
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  flex: 4,
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _currentIndex,
                    steps: allStep(),
                    onStepCancel: () {
                      if (_currentIndex == 0) {
                        return;
                      }
                      setState(() {
                        _currentIndex -= 1;
                      });
                    },
                    onStepTapped: (int index) {
                      if (formKeys[_currentIndex].currentState!.validate()) {
                        setState(() {
                          _currentIndex = index;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (formKeys[_currentIndex].currentState!.validate() &&
                          _currentIndex < (allStep().length - 1)) {
                        setState(() {
                          _currentIndex += 1;
                        });
                      }
                    },
                    controlsBuilder: (context, details) {
                      final isLastStep = _currentIndex == allStep().length - 1;
                      return Container(
                        child: Row(
                          children: [
                            if (_currentIndex > 0)
                              Expanded(
                                flex: 4,
                                child: ElevatedButton(
                                  onPressed: details.onStepCancel,
                                  child: const Text('Retour'),
                                ),
                              ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 4,
                                child: (isLastStep)
                                    ? ElevatedButton(
                                        onPressed: onPressed,
                                        child: const Text("S'inscrire"))
                                    : ElevatedButton(
                                        onPressed: details.onStepContinue,
                                        child: const Text("Suivant")))
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> allStep() => [
        Step(
            state: _currentIndex <= 0 ? StepState.indexed : StepState.complete,
            isActive: _currentIndex >= 0,
            title: const Text("Profil"),
            content: Form(
              key: formKeys[0],
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Expanded(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        _emailInput(),
                        _loginInput(),
                      ],
                    ),
                  )),
            )),

        Step(
          state: _currentIndex <= 1 ? StepState.indexed : StepState.complete,
          isActive: _currentIndex >= 1,
          title: const Text("Mot de passe"),
          content: Form(
            key: formKeys[1],
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: <Widget>[
                  _passwordInput(),
                  _verifPasswordInput(),
                ],
              ),
            ),
          ),
        ),

        Step(
          state: _currentIndex <= 2 ? StepState.indexed : StepState.complete,
          isActive: _currentIndex >= 2,
          title: const Text("Info"),
          content: Form(
            key: formKeys[2],
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: <Widget>[
                  _firstNameInput(),
                  _lastNameInput(),
                  _localisationInput(),
                ],
              ),
            ),
          ),
        ),

        // Step(
        //   state: _currentIndex <= 3 ? StepState.editing : StepState.complete,
        //   isActive: _currentIndex >= 3,
        //   title: const Text("Mot de passe"),
        //   content: Container(
        //     child: Column(
        //       children: [
        //         Text('Pseudo: ${_email.text}'),
        //         Text('Email: ${_login.text}'),
        //         Text('Localisation : ${_location.text}'),
        //         Text('Nom : ${_firstName.text}'),
        //         Text('Prenom : ${_lastName.text}'),
        //       ],
        //     ),
        //   ),
        // ),
      ];

  //Je créer tout mes composants (Widget en flutter) de la page en dehors
  //du build

  Widget _emailInput() {
    return TextFormField(
      controller: _email,
      validator: emailValidator,
      obscureText: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        border: OutlineInputBorder(),
        labelText: 'E-mail',
      ),
    );
  }

// Liste des champs

  Widget _loginInput() {
    return TextFormField(
      controller: _login,
      validator: userValidator,
      obscureText: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        border: OutlineInputBorder(),
        labelText: 'Pseudo',
      ),
    );
  }

  Widget _lastNameInput() {
    return TextFormField(
      controller: _lastName,
      obscureText: false,
      decoration: const InputDecoration(
        labelText: 'Prénom',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _firstNameInput() {
    return TextFormField(
        controller: _firstName,
        obscureText: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Nom',
        ));
  }

  Widget _passwordInput() {
    return TextFormField(
        controller: _password,
        obscureText: true,
        validator: passValidator,
        decoration: const InputDecoration(
          icon: Icon(Icons.password),
          labelText: 'Mot de passe',
          border: OutlineInputBorder(),
        ));
  }

  Widget _verifPasswordInput() {
    return TextFormField(
        controller: _passwordVerif,
        obscureText: true,
        validator: passVerifValidator,
        decoration: const InputDecoration(
          icon: Icon(Icons.password),
          labelText: 'Verification du mot de passe',
          border: OutlineInputBorder(),
        ));
  }

  Widget _localisationInput() {
    return TextFormField(
        controller: _location,
        obscureText: false,
        validator: locationValidator,
        decoration: const InputDecoration(
          icon: Icon(Icons.add_location),
          labelText: 'Localisation',
          border: OutlineInputBorder(),
        ));
  }

  // -----------------------------------------------------

  // Bouton de validation

  Widget _button() {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Valider'),
    );
  }
  // ----------------------------------------

  // Titre mais faut le changer en Logo

  Widget _title() {
    return const Flexible(flex: 2, child: Text('TrocBay'));
  }

  // ----------------------------------------

  @override
  void dispose() {
    _email.dispose();
    _login.dispose();
    _lastName.dispose();
    _firstName.dispose();
    _password.dispose();
    _passwordVerif.dispose();
    _location.dispose();
    super.dispose();
  }

  String? emailValidator(v) {
    var regEmail = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
        caseSensitive: false, multiLine: false);

    if (v.isEmpty) {
      return "L'E-mail est obligatoire";
    }

    if (regEmail.allMatches(v).length != 1) {
      return "Entrez une adresse e-mail valide";
    }
    return null;
  }

  String? userValidator(v) {
    if (v.isEmpty) {
      return "Le pseudo est obligatoire";
    }
    return null;
  }

  String? passValidator(v) {
    // switch () {
    //   case :

    //     break;
    //   default:
    // }

    // A modifier plus tard
    var regPassMaj = RegExp(r"^(?=.*?[A-Z])");
    var regChiffre = RegExp(r'^(?=.*?[0-9])');
    if (v.isEmpty) {
      return "Le mot de passe est obligatoire";
    }
    if (v.length < 8) {
      return "Le mot de passe doit comporter 8 caractères";
    }
    if (regPassMaj.allMatches(v).length != 1) {
      return "Le mot de passe doit contenir une majuscule";
    }
    if (regChiffre.allMatches(v).length != 1) {
      return "Le mot de passe doit contenir un chiffre";
    }

    return null;
  }

  String? passVerifValidator(v) {
    if (v.isEmpty) {
      return "La verification est obligatoire";
    }
    if (v != _password.text) {
      return "Les mots de passe ne sont pas identiques";
    }
    return null;
  }

  String? locationValidator(v) {
    if (v.isEmpty) {
      return "Votre adresse est obligatoire";
    }
    return null;
  }

  onPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _attente = true;
      });

      User user = User(
          id: 0,
          pseudo: _login.text,
          email: _email.text,
          pass: _password.text,
          firstName: _firstName.text,
          lastName: _lastName.text,
          localisation: _location.text);

      print(user);

      Future<http.Response> reg = Register.addRegister(user);

      Map<String, dynamic> reg2 = {};

      await reg.then((value) => reg2.addAll(jsonDecode(value.body)));

      if (reg2["flag"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inscription de ' + _email.text)),
        );

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LogInPage(
                      title: 'none',
                    )));

        setState(() {
          _attente = false;
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(reg2["message"])));
      }
    }
  }

// Fonction annexe ------------------------

}
