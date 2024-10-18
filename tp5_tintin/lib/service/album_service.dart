import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/models/gps_model.dart';

import 'package:faker/faker.dart';

class AlbumService {
  // Methode de génération d'album a l'aide de Faker
  // Inutile avec le JSON
  static Future<List<Album>> generateAlbum() async {
    //listAlbum récupère un Array de type album
    //.generate permet de "boucler" pour ajouter 100 instance de Album
    List<Album> listAlbum = List<Album>.generate(
        100,
        (i) => Album(
            title: faker.lorem.sentence(),
            numero: random.integer(450),
            year: random.integer(2028),
            image: faker.lorem.sentence(),
            resume: faker.lorem.sentence(),
            gps: Gps(faker.geo.latitude(), faker.geo.longitude()),
            location: faker.address.city()));
    return listAlbum;
  }

  // Methode permettant de recupérer les éléments du fichier JSON
  /*
  Elle recupère le JSON avec rootBundle.loadString (pour les convertir en String)
  cela de manière asynchrone. Ensuite elle est décoder de son format JSON pour être
  caster en Map<String,Dynamic>
  */

  static Future<List<Album>> fetchAlbum() async {
    final String jsonString =
        await rootBundle.loadString('data/albums-tintin.json');
    var data = (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();
    //retourne une List<Album> qui sera asychone en l'attente de récupération de JSON String
    //on "boucle" sur la map pour extraire les donnée dynamic que l'on "cast" en liste
    //Explication du fromJson dans album_model.dart
    return data.map<Album>((json) => Album.fromJson(json)).toList();
  }
}
