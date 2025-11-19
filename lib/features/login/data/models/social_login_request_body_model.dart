class SocialLoginRequestBodyModel {
  final String provider;
  final String accessToken;
  final String? email;
  final String? name;
  final String? photoUrl;

  SocialLoginRequestBodyModel({
    required this.provider,
    required this.accessToken,
    this.email,
    this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'accessToken': accessToken,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (photoUrl != null) 'photoUrl': photoUrl,
    };
  }
}
