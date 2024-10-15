import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double _counter = 0;
  double increment = 2;
  String? operator = "+";

  final _addIncrement = TextEditingController();
  bool isSup = false;
  bool showError = false;

  void _incrementCounter() {
    setState(() {
      if (int.parse(_addIncrement.text) >= 1) {
        increment = double.parse(_addIncrement.text);
        _counter += increment;

        if (_counter >= 1) {
          isSup = true;
        }

        if (operator == "+") {
          _counter += increment;
        } else if (operator == "/") {
          _counter = _counter / increment;
        } else if (operator == "*") {
          _counter = _counter * increment;
        } else if (operator == "-") {
          _counter = _counter - increment;
        }
      } else {
        _dialogError(context);
      }
    });
  }

  void _resetButton() {
    setState(() {
      _counter = 0;
    });
  }

  String? incrementValidator(v) {
    if (v < 1) {
      return 'la valeur a incrémenter doit être > à 1';
    }
    return null;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isSup
                ? Text(
                    'Vous avez cliquer $_counter fois sur le bouton',
                  )
                : const Text('Pas encore supérieur a 1'),
            DropdownButton<String>(
              items: <String>["+", "/", "-", "*"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  operator = newValue;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _addIncrement,
                validator: incrementValidator,
                decoration: const InputDecoration(
                  labelText: 'Ajout un increment',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(' $increment + $_counter = '),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            ElevatedButton(
                onPressed: _resetButton, child: const Icon(Icons.replay))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text('$operator  $increment'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<void> _dialogError(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('Error'),
        content: Text(
          'Vous ne pouvez pas avoir une valeur inférieur a 1',
        ),
      );
    },
  );
}
