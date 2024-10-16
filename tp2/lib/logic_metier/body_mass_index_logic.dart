class BodyMassIndexLogic {
  // Méthode pour calculer l'IMC
  double calculateImc(double poids, double taille) {
    return poids / ((taille / 100) * (taille / 100));
  }

  String getCategory(double imc) {
    switch (imc) {
      case var v when (v < 18.5):
        return "Anorexie";
      case var v when (v >= 18.5 && v < 25):
        return "Normal";
      case var v when (v >= 25 && v < 30):
        return "Surpoids";
      case var v when (v >= 30 && v < 35):
        return "Obèse";
      case var v when (v >= 35):
        return "Obèse morbide";
      default:
        return "Valeur inconnue";
    }
  }

  String? validateInput(String value) {
    RegExp reg = RegExp(r'^[0-9]*$');
    if (value.isEmpty) {
      return 'Champs obligatoire';
    } else if (!reg.hasMatch(value)) {
      return 'Utiliser uniquement des nombres';
    } else if (value.length > 3) {
      return 'Uniquement 3 chiffres';
    }
    return null;
  }
}
