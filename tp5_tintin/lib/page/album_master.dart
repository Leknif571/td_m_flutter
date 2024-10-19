//C'est le widget album_skeleton.dart / reférence a ma nomanclature habituelle.

//Import flutter material lib - compasant ui etc
import 'package:flutter/material.dart';

//Import de mes modèles
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/page/album_world_map.dart';
import 'package:tp5_tintin/providers/reading_list_provider.dart';

//Import de mes services et logique métier
// import 'package:tp5_tintin/service/album_service.dart';
// import '../logic_metier/add_favourite_album.dart';

//Import de mes widgets
import '../widget/album_preview.dart';

class AlbumMaster extends StatefulWidget {
  const AlbumMaster({super.key});

  @override
  State<AlbumMaster> createState() => _AlbumMasterState();
}

class _AlbumMasterState extends State<AlbumMaster> {
  late Future<List<Album>> items;

  @override
  void initState() {
    /* Appel de la Méthode de génération aléatoire */
    // items = AlbumService.generateAlbum();
    /* Appel de la Méthode de récupération du json depuis le service */
    // items = AlbumService.fetchAlbum();

    /* Appel de la Méthode de récupération du json depuis le Provider */
    items = ReadingListProvider().getAllAlbum();

    // print(items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Album",
            style: TextStyle(color: Colors.white),
          )),
          leading: IconButton(
              onPressed: () => {ReadingListProvider().setDarkMode()},
              icon: const Icon(
                Icons.dark_mode,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlbumWorldMap())),
                icon: const Icon(
                  Icons.map_sharp,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder<List<Album>?>(
            future: items,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PreviwAlbum(album: snapshot.data?[index]);
                  },
                );
              }

              /// handles others as you did on question
              else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              }
            }));
  }
}
