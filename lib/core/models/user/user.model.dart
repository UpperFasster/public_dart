class UserDTO {
  String? firstname;
  String? lastname;
  String userId;
  String token;
  String role;

  UserDTO({
    this.firstname,
    this.lastname,
    required this.userId,
    required this.token,
    required this.role,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      userId: json['userId'] as String,
      token: json['token'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'userId': userId,
      'token': token,
      'role': role,
    };
  }
}
