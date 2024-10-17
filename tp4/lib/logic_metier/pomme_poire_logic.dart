import 'dart:math';
import 'package:flutter/material.dart';
import '../model/enum/enum_typenb.dart';

class PommePoireLogic {
  int counter;
  final List<int> fruits;
  final List<String> logo;
  final Map<TypeNombre, String?> fruitImagePath;

  PommePoireLogic(this.counter, this.fruits, this.logo, this.fruitImagePath);

  void onPressed() {
    counter++;
    fruits.add(counter);

    if (isPremier(counter)) {
      logo.add(fruitImagePath[TypeNombre.premier]!);
    } else if (isPair(counter)) {
      logo.add(fruitImagePath[TypeNombre.pair]!);
    } else {
      logo.add(fruitImagePath[TypeNombre.impair]!);
    }
  }

  void onRemoved(int i) {
    fruits.removeAt(i);
    logo.removeAt(i);
  }

  String? displayBar(int v) {
    if (v <= 0) {
      return null;
    }
    String? type = resultReturnString(v);
    String? number = v.toString();
    return 'Nombre $type : $number';
  }

  String? resultReturnString(int v) {
    if (isPremier(v)) {
      return TypeNombre.premier.name;
    } else if (isPair(v)) {
      return TypeNombre.pair.name;
    }
    return TypeNombre.impair.name;
  }

  bool isPremier(int v) {
    if (v <= 1) return false;
    for (int i = 2; i <= sqrt(v); i++) {
      if (v % i == 0) return false;
    }
    return true;
  }

  bool isPair(int v) {
    if (v % 2 == 0) {
      return true;
    }
    return false;
  }

  MaterialColor color(int v) {
    if (isPair(v)) {
      if (v == 0) {
        return Colors.cyan;
      }
      return Colors.orange;
    } else {
      return Colors.purple;
    }
  }
}
