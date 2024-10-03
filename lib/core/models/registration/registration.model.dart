class RegistrationDTO {
  final String password;
  final String phoneNumber;
  final String username;

  RegistrationDTO({
    required this.password,
    required this.phoneNumber,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'phoneNumber': phoneNumber,
      'username': username,
    };
  }
}
