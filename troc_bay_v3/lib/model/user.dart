class User {
  int id;
  String pseudo;
  String email;
  String pass;
  String firstName;
  String lastName;
  String localisation;

  User({
    required this.id,
    required this.pseudo,
    required this.email,
    required this.pass,
    required this.firstName,
    required this.lastName,
    required this.localisation,
  });

  static List<dynamic> test(List<dynamic> json) {
    // print(json);
    List test = [];

    for (var singleUser in json) {
      User user = User(
          id: singleUser['id'],
          pseudo: singleUser["email"],
          email: singleUser["pseudo"],
          pass: singleUser["pass"],
          firstName: singleUser["firstName"],
          lastName: singleUser["lastName"],
          localisation: singleUser["localisation"]);

      //Adding user to the list.
      test.add(user);
    }

    return test;
  }
}
