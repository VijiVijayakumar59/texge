// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SignupService {
//   final String signupUrl = "http://app.texge.de/api/signup";

//   Future<void> signup({
//     required String name,
//     required String email,
//     required String phone,
//     required String password,
//     required String passwordConfirmation,
//   }) async {
//     final response = await http.post(
//       Uri.parse(signupUrl),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'name': "rohit",
//         'email': "rohit@example111.com",
//         'phone': "87370729271111",
//         'password': "12345678",
//         'password_confirmation': "12345678",
//       }),
//     );

//     if (response.statusCode == 200) {
//       final responseBody = jsonDecode(response.body);
//       if (responseBody['response'] == 'success') {
//         print('Customer Sign Up Successful');

//         print('Token: ${responseBody['data']['token']}');
//       } else {
//         print('Signup failed: ${responseBody['message']}');
//       }
//     } else {
//       print('Server error: ${response.statusCode}');
//     }
//   }
// }

// signup_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupService {
  final String signupUrl = "http://app.texge.de/api/signup";

  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await http.post(
      Uri.parse(signupUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {
        'response': 'error',
        'message': 'Server error: ${response.statusCode}',
      };
    }
  }
}
