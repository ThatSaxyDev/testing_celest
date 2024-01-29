//! login
import 'package:celest_backend/client.dart';

Future<Responsee> login({
  required String email,
  required String password,
}) async {
  final badResponse = Responsee(status: false, message: 'Invalid credentials');
  final goodResponse = Responsee(status: true, message: 'Login successful');
  await Future.delayed(const Duration(seconds: 5));
  if (email != 'a@mail.com' || password != 'Test202@') {
    print(badResponse.toString());
    return badResponse;
  }
  print(goodResponse);
  return goodResponse;
}
