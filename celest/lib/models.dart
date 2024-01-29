// ignore_for_file: public_member_api_docs, sort_constructors_first
//! user model
class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String username;
  final UserType type;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.username,
    required this.type,
  });
}

enum UserType { driver, passenger }

//! response
class Responsee {
  final bool status;
  final String message;

  Responsee({
    required this.status,
    required this.message,
  });

  @override
  String toString() => 'Responsee(status: $status, message: $message)';
}
