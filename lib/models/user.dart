class UserModel {
  final String username;
  final String email;

  UserModel({required this.username, required this.email});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      email: json["email"],
    );
  }
}
