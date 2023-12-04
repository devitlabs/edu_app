import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient  {
  static const baseUrl = "http://164.160.33.223:8080";

  static Future<Map<String,dynamic>?> login({required String login, required String password}) async {
    try {
      var data = jsonEncode({
        "data": {
          "login": login,
          "password": password
        }
      });
      final response = await http.post(
        Uri.parse('${baseUrl}/utilisateur/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}