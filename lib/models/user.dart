import 'dart:convert';

class Users {
  final String id;
  final String username;
  final String? profile_image; // Nullable to handle missing data
  final String email;

  Users({
    required this.id,
    required this.username,
    this.profile_image, // Nullable to prevent crashes
    required this.email,
  });

  factory Users.fromMap(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? '', // Ensure it's never null
      username: json['username'] ?? '', // Ensure it's never null
      profile_image: json['profile_image'] as String?, // Allow null
      email: json['email'] ?? '', // Ensure it's never null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'profile_image': profile_image ?? '', // Default empty string
      'email': email,
    };
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));
}
