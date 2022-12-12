class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  int? id;
  String? name;
  String? username;
  String? email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
      };
}
