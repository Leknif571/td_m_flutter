class Gps {
  double latitude;
  double longitude;

  Gps(this.latitude, this.longitude);

  /*
  Comme nous récupérons un string au lieu de 2 donnée de type double
  Nous devons split la chaine au niveau de la virgule afin de récuperer les 
  deux string dans une liste que l'on parse en double
  */
  factory Gps.fromJson(String jsonData) {
    List<String> splitGps = jsonData.toString().split(',').toList();
    double latitude = double.parse(splitGps[0]);
    double longitude = double.parse(splitGps[1]);
    return Gps(latitude, longitude);
  }
}
