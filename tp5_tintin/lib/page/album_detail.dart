import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/providers/reading_list_provider.dart';
import 'package:latlong2/latlong.dart';

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
                  Container(
                    height: 400,
                    alignment: Alignment.centerLeft,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(
                            widget.album.gps.latitude,
                            widget.album.gps
                                .longitude), // Center the map over London
                        initialZoom: 9.2,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(widget.album.gps.latitude,
                                  widget.album.gps.longitude),
                              width: 80,
                              height: 80,
                              child: const Icon(
                                Icons.pin_drop_sharp,
                                color: Color.fromARGB(255, 204, 14, 0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
