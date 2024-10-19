import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/page/album_detail.dart';
import 'package:tp5_tintin/providers/reading_list_provider.dart';
import 'package:latlong2/latlong.dart';

// import '../logic_metier/add_favourite_album.dart';

class AlbumWorldMap extends StatefulWidget {
  const AlbumWorldMap({
    super.key,
  });

  @override
  State<AlbumWorldMap> createState() => _AlbumWorldMapState();
}

class _AlbumWorldMapState extends State<AlbumWorldMap> {
  late Future<List<Album>> lAlbum;
  @override
  void initState() {
    lAlbum = ReadingListProvider().getAllAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "MAP",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<List<Album>?>(
              future: lAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      height: 500,
                      alignment: Alignment.center,
                      child: FlutterMap(
                          options: const MapOptions(
                            initialCenter:
                                LatLng(0, 0), // Center the map over London
                            initialZoom: 0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: snapshot.data!.map((album) {
                                return Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: LatLng(album.gps.latitude,
                                        album.gps.longitude),
                                    child: IconButton(
                                        icon: const Icon(Icons.location_on,
                                            color: Colors.red, size: 40),
                                        onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AlbumDetail(
                                                          album: album)),
                                            )));
                              }).toList(),
                            ),
                          ]));
                }

                /// handles others as you did on question
                else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                }
              })),
    );
  }
}
