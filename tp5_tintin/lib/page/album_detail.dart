import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/providers/reading_list_provider.dart';
// import '../logic_metier/add_favourite_album.dart';

class AlbumDetail extends StatefulWidget {
  final Album album;
  const AlbumDetail({
    super.key,
    required this.album,
  });

  @override
  State<AlbumDetail> createState() => _AlbumDetailState();
}

class _AlbumDetailState extends State<AlbumDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            widget.album.title,
            style: const TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Album numéro: ${widget.album.numero}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Résumé: ${widget.album.resume}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Année de parution: ${widget.album.year}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'numero : ${widget.album.numero}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 400,
                        child: Image(
                            image: AssetImage('images/${widget.album.image}'))),
                  ),
                  Consumer<ReadingListProvider>(
                      builder: (context, value, child) {
                    return ElevatedButton(
                        onPressed: () {
                          value.favouriteAction(widget.album);
                        },
                        child: Icon(
                            value.listFavourite.contains(widget.album.numero)
                                ? Icons.favorite
                                : Icons.heart_broken_outlined));
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
