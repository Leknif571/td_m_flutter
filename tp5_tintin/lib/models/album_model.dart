import 'dart:convert';

import 'package:tp5_tintin/models/gps_model.dart';

class Album {
  String title;
  int numero;
  int year;
  int? yearInColor;
  String image;
  String resume;
  Gps gps;
  String location;

  Album(
      {required this.title,
      required this.numero,
      required this.year,
      this.yearInColor,
      required this.image,
      required this.resume,
      required this.gps,
      required this.location});

  @override
  String toString() {
    return 'Titre : $title, Numéro: $numero, Year: $year, YearInColor:$yearInColor, Image: $image, Résumer : $resume, GPS : $gps, Location: $location';
  }

  String toJson() {
    Map<String, dynamic> albumToJson = {
      'title': title,
      'numero': numero,
      'year': year,
      'yearInColor': yearInColor,
      'image': image,
      'resume': resume,
      'gps': gps,
      'location': location,
    };

    return jsonEncode(albumToJson);
  }

  /* 
  Cette fonction récupére ce qu'on lui donne depuis AlbumService méthode 
  fetchAlbum, cette méthode Factory ne retourne que des instance d'Album depuis
  chaque instance du map bouclé dans fetchAlbum. Ensuite on récupére leurs valeurs
  en les "pointant" 
  */
  factory Album.fromJson(Map<String, dynamic> jsonData) {
    return Album(
        title: jsonData['titre'],
        numero: jsonData['numero'],
        year: jsonData['parution'],
        image: jsonData['image'],
        resume: jsonData['resume'],
        //Voir class gps_model
        gps: Gps.fromJson(jsonData['gps']),
        location: jsonData['lieu']);
  }
}
