class LoginDTO {
  final String phoneNumber;
  final String password;

  LoginDTO({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
