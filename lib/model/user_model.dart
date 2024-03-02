class UserModel {

  static String collectionName = "Users";

  String id;
  String userName;
  String email;
  String phone;
  bool emailVerified;

  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      this.phone = "",
      this.emailVerified = false});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            email: json['email'],
            userName: json['userName'],
            phone: json['[phone]'],
            id: json['id'],
            emailVerified: json['emailVerified']);

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "userName": userName,
      "phone": phone,
      "id": id,
      "emailVerified": emailVerified
    };
  }
}
