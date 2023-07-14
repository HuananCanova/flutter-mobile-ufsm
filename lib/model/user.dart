class User {
  //String id;
  String name;
  String email;
  String password;

  User({
    //required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, Object?> toMap() {
    return {
      //'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

}
