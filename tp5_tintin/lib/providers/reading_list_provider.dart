import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/service/album_service.dart';
import 'package:tp5_tintin/db_instance/db_instance.dart';

class ReadingListProvider extends ChangeNotifier {
  List<int> listFavourite = [];
  bool isDarkMode = false;

  // Constructeur
  ReadingListProvider() {
    _initFavourites();
  }

  // Initialisation des favoris au démarrage
  void _initFavourites() async {
    await updateFavouriteList();
  }

  //Methode retournant un booléan qui vérifie si un Album est dans la liste favori
  // Non utile avec le provider
  // bool isFavourite(Album? a) {
  //   if (listFavourite.contains(a)) {
  //     return true;
  //   }
  //   return false;
  // }

  //Méthode d'ajout de favori dans la liste
  void addFavourite(Album a) async {
    final Database db = await DbInstance.database();
    await db.insert('favourite', {'number': a.numero});
  }

  // Mise a jour de la liste des favoris
  Future<void> updateFavouriteList() async {
    listFavourite = await getAllFavourite();

    notifyListeners();
  }

  //Méthode de suppression de favori dans la liste
  void removeFavourite(Album a) async {
    final Database db = await DbInstance.database();
    await db.delete('favourite', where: 'number=?', whereArgs: [a.numero]);
  }

  Future<List<int>> getAllFavourite() async {
    final db = await DbInstance.database();
    final List<Map<String, dynamic>> maps = await db.query('favourite');
    List<int> list = List.generate(maps.length, (i) => maps[i]['number']);
    return list;
  }

  /* 
  Méthode permettant de switch (comme un toggle) entre le fait d'ajouter ou de 
  supprimer en fonction de si l'album est déjà dans la liste ou pas. 
  */

  void favouriteAction(Album a) async {
    if (listFavourite.contains(a.numero)) {
      /*
      Remarque j'aurais pu directement faire appel a la fonction native .remove
      et .add mais pour une meilleur lecture du code et si j'imagine un jour faire 
      des ajouts ou le récupe comme un template pour une autre application je peux
      envisager de faire des vérification ou formatage plus poussé directement dans 
      la fonction     
      */
      removeFavourite(a);
    } else {
      // removeFavourite(a);
      addFavourite(a);
    }
    updateFavouriteList();
  }

  Future<List<Album>> getAllAlbum() async {
    List<Album> listAlbum = await AlbumService.fetchAlbum();
    return listAlbum;
  }

  Future<Album> getAlbumByNumero(int n) async {
    List<Album> listAlbum = await AlbumService.fetchAlbum();
    Album oneAlbum = listAlbum[n];
    return oneAlbum;
  }

  // J'aurais normalement du créer un autre provider pour gérer cela, mais la
  // je perd patience ^^'

  void setDarkMode() {
    if (isDarkMode) {
      isDarkMode = false;
    } else {
      isDarkMode = true;
    }
  }
}
