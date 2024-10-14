class Troc {
  // int id = 0;
  String label;
  String description;
  String imageBase64;
  int idUser;

  Troc(
      {
      // required this.id,
      required this.label,
      required this.description,
      required this.imageBase64,
      required this.idUser});

  static List<dynamic> test(List<dynamic> json) {
    // print(json);
    List test = [];

    for (var singleTroc in json) {
      Troc user = Troc(
          label: singleTroc["label"],
          description: singleTroc["description"],
          imageBase64: singleTroc["image"],
          idUser: singleTroc["idUser"]);

      //Adding user to the list.
      test.add(user);
    }

    return test;
  }
}
