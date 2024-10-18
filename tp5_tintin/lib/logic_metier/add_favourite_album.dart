import 'package:tp5_tintin/models/album_model.dart';

// Classe logique métier de l'étape 8 // Elle ne sera plus utile avec le provider
//  Les  commentaires d'explications se trouve dans la classe provider fichier reading_list_provider
class AddFavouriteAlbum {
  List<Album> listFavourite;

  AddFavouriteAlbum(this.listFavourite);

  bool isFavourite(Album? a) {
    if (listFavourite.contains(a)) {
      return true;
    }
    return false;
  }

  void addFavourite(Album a) {
    listFavourite.add(a);
  }

  void removeFavourite(Album a) {
    listFavourite.remove(a);
  }

  void favouriteAction(Album a) {
    if (listFavourite.contains(a)) {
      removeFavourite(a);
    } else {
      addFavourite(a);
    }
  }
}
