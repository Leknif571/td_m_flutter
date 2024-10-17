import 'package:tp5_tintin/modeles/album_model.dart';
import 'package:tp5_tintin/modeles/gps_model.dart';

import 'package:faker/faker.dart';

class AlbumService {
  static Future<List<Album>> generateAlbum() async {
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
}
