
# 📱 td_m_flutter

## 🚀 Initiation à Flutter

👤 **BOUKADA ADEL**  
**TD Flutter**

### 📋 Flutter Application 1 : Reprise en main de Flutter

### 📋 TP1 : Calculatrice  
✅ Tout a été terminé.

### 📋 TP2 : IMC  
✅ Tout a été terminé.  
✅ Tout les tests unitaires ont étaient effectués. Widget et logique métier.

### 🎰 TP3 : Casino  
⚠️ Tout a été terminé, sauf l'animation des symboles. J'avais avancé dessus, mais la terminer m'aurait fait perdre trop de temps, donc j'ai supprimer mon état d'avancer (car il créer des bugs).  
🔧 **Astuce pour tester différentes issues** :  
- Vous pouvez aller dans la logique métier du fichier [casino_logic.dart](https://github.com/Leknif571/td_m_flutter/blob/main/tp3/lib/logic_metier/casino_logic.dart), commenter les issues inutiles et décommenter celles que vous voulez tester. Cela permet de gagner du temps pour les tests.  
Par exemple, pour tester l'issue du jackpot, vous obtiendrez ce code :

```dart
Map<int, String?> returnTable(List listImage) {
  Map<int, String?> indexMap = {};
  indexMap.clear();
  for (int i = 0; i < 3; i++) {
    Random r = Random();
    /* Pour tester aléatoire */
    // int index = r.nextInt(7);
    /* Pour tester victoire normale */
    // int index = 1;
    /* Pour tester victoire jackpot */
    int index = 6;
    indexMap.addAll({i: listImage[index]});
  }
  return indexMap;
}
```
⚠️ Je n'ai pas eu le temps de faire les tests unitaires

### 🍎🍐🍍 TP4 : Pomme Poire Ananas  
✅ Tout a été terminé.
⚠️ Je n'ai pas eu le temps de faire les tests unitaires.

### 📚 TP5 : Titin  
⚠️ Tout a été terminé, sauf l'UI et le mode sombre.  
- Le bouton pour accéder à la map se trouve dans la **AppBar**, à droite dans la partie **Action**.  
- En cliquant sur un livre, on est téléporté vers son détail.  
- Pour la base de données, j'ai utilisé **Sqflite**, donc cela fonctionne sur Android, macOS, iOS, mais pas sur Windows.  
- Le fichier `adb_test` est juste une extraction de ma base de données `favourite.db` depuis le shell ADB, afin que je puisse visualiser les données via **DbEaver**.  
⚠️ Je n'ai pas eu le temps de faire les tests unitaires

---

## 📝 Mon avis sur le cours

J'ai beaucoup aimé cette initiation. J'avais déjà pratiqué Flutter un peu lors d'un petit cours en licence, mais nous étions surtout en autonomie. J'avais appris quelques concepts, mais Flutter restait encore flou, notamment la gestion des fichiers. Le code métier était mélangé avec le code UI.  
Le lien vers mon dépôt de projet d'initiation en licence (un peu catastrophique 😅) se trouve à la fin.

Les cours étaient suffisamment compréhensibles et la progression dans les projets était optimale pour bien progresser. Dans l'ensemble, c'est très positif. Si je devais absolument donner un point négatif, ce serait que certaines consignes doivent être relues plusieurs fois pour être bien comprises, mais cela relève plus d'une question de compréhension personnelle.

---

### 🛠️ Ancien projet Flutter (année de licence) :  
[AppFlutter - Projet Licence](https://github.com/Leknif571/AppFlutter)
