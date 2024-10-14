import 'package:flutter/material.dart';
import '../model/user.dart';
import '../crud/userCrud/updateRegister.dart';
import '../crud/userCrud/updateRegister.dart';

class updateP extends StatefulWidget {
  const updateP({Key? key}) : super(key: key);
  @override
  State<updateP> createState() => _updatePState();
}

class _updatePState extends State<updateP> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _login = TextEditingController();
  final _lastName = TextEditingController();
  final _firstName = TextEditingController();
  final _password = TextEditingController();
  final _passwordVerif = TextEditingController();
  final _location = TextEditingController();

  bool _attente = false;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Votre compte'),
          backgroundColor: Colors.black,
          toolbarHeight: 63,
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _userMailInput(),
                    _userPseudoInput(),
                    _userlastNameInput(),
                    _firstNameInput(),
                    _localisationInput(),
                    _passwordInput(),
                    _validBtn()
                  ],
                ),
              )),
        ));
  }

  Widget _userMailInput() {
    return Flexible(
        flex: 2,
        child: TextFormField(
          controller: _email,
          obscureText: false,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ));
  }

  Widget _userPseudoInput() {
    return Flexible(
        flex: 2,
        child: TextFormField(
          controller: _login,
          obscureText: false,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            border: OutlineInputBorder(),
            labelText: 'Pseudo',
          ),
        ));
  }

  Widget _userlastNameInput() {
    return Flexible(
        flex: 2,
        child: TextFormField(
          controller: _lastName,
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Prénom',
          ),
        ));
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
        // validator: passValidator,
        decoration: const InputDecoration(
          icon: Icon(Icons.password),
          labelText: 'Mot de passe',
          border: OutlineInputBorder(),
        ));
  }

  Widget _localisationInput() {
    return TextFormField(
        controller: _location,
        obscureText: false,
        // validator: locationValidator,
        decoration: const InputDecoration(
          icon: Icon(Icons.add_location),
          labelText: 'Localisation',
          border: OutlineInputBorder(),
        ));
  }

  Widget _validBtn() {
    return (ElevatedButton(
        onPressed: onUpdate, child: const Text('Mettre à jour')));
  }

  onUpdate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _attente = true;
      });

      User user = User(
          id: 2,
          pseudo: _login.text,
          email: _email.text,
          pass: _password.text,
          firstName: _firstName.text,
          lastName: _lastName.text,
          localisation: _location.text);

      print(user);
      UpdateRegister.upRegister(user);
    }

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

    onPressed() {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _attente = true;
        });

        User user = User(
            id: 1,
            pseudo: _login.text,
            email: _email.text,
            pass: _password.text,
            firstName: _firstName.text,
            lastName: _lastName.text,
            localisation: _location.text);

        print(user);

        UpdateRegister.upRegister(user);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mise à jour')),
        );

        setState(() {
          _attente = false;
        });
      }
    }
  }
}
