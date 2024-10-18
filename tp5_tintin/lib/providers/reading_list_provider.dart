import 'package:flutter/foundation.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/service/album_service.dart';

class ReadingListProvider extends ChangeNotifier {
  final List<Album> listFavourite = [];

  //Methode retournant un booléan qui vérifie si un Album est dans la liste favori
  // Non utile avec le provider
  // bool isFavourite(Album? a) {
  //   if (listFavourite.contains(a)) {
  //     return true;
  //   }
  //   return false;
  // }

  //Méthode d'ajout de favori dans la liste
  void addFavourite(Album a) {
    listFavourite.add(a);
    notifyListeners();
  }

  //Méthode de suppression de favori dans la liste
  void removeFavourite(Album a) {
    listFavourite.remove(a);
    notifyListeners();
  }

  /* 
  Méthode permettant de switch (comme un toggle) entre le fait d'ajouter ou de 
  supprimer en fonction de si l'album est déjà dans la liste ou pas. 
  */

  void favouriteAction(Album a) {
    if (listFavourite.contains(a)) {
      /*
      Remarque j'aurais pu directement faire appel a la fonction native .remove
      et .add mais pour une meilleur lecture du code et si j'imagine un jour faire 
      des ajouts ou le récupe comme un template pour une autre application je peux
      envisager de faire des vérification ou formatage plus poussé directement dans 
      la fonction     
      */
      removeFavourite(a);
    } else {
      addFavourite(a);
    }
    notifyListeners();
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
}
