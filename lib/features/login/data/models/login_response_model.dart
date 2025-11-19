class LoginResponseModel {
  String? token;
  User? user;
  String? message;

  LoginResponseModel({this.token, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
  }
}

class User {
  final String? id;
  final String? email;
  final String? name;
  final String? mobile;
  final String? country;
  final String? role;
  final String? profilePicture;

  User({
    this.id,
    this.email,
    this.name,
    this.mobile,
    this.country,
    this.role,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      mobile: json['mobile'],
      profilePicture: json['profilePicture'],
    );
  }
}
