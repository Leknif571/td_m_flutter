import 'package:flutter/material.dart';
import 'package:troc_bay_v3/model/troc.dart';
import '../model/troc.dart';
import '../crud/trocCrud/addtroc.dart';

class NewTroc extends StatefulWidget {
  NewTroc({Key? key, required this.id}) : super(key: key);
  int id;
  @override
  State<NewTroc> createState() => _NewTrocState();
}

class _NewTrocState extends State<NewTroc> {
  final _formKey = GlobalKey<FormState>();
  bool _attente = false;
  final _label = TextEditingController();
  final _description = TextEditingController();
  final _image = TextEditingController();

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
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _label,
                    decoration: InputDecoration(
                      labelText: 'Intituler du troc',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _description,
                    validator: verifDescription,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Description',
                    ),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 6,
                    maxLines: null,
                  ),
                  ElevatedButton(
                      onPressed: onPressed, child: const Text('Valider'))
                ],
              ),
            ),
          ),
        ));
  }

  String? verifDescription(v) {
    if (v.isEmpty()) {
      SnackBar(
        content: Text("Attention rentrer une valeur"),
      );
    }
  }

  onPressed() {
    // if (_formKey!.validate()) {
    //   setState(() {
    //     _attente = true;
    //   });

    Troc troc = Troc(
        label: _label.text,
        description: _description.text,
        imageBase64: 'image',
        idUser: widget.id);

    print(troc);

    addTroc.addTrocs(troc);
    // register.addRegister(user);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Votre troc a été créer')),
    );

    // setState(() {
    //   _attente = false;
    // });
  }
}
