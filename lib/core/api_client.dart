import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/document_model.dart';

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

  static Future<List<DocumentModel>?> getDocuments() async {
    try {
      var data = jsonEncode({
        "user": "1",
        "isSimpleLoading": false,
        "data": {}
      });
      final response = await http.post(
        Uri.parse('${baseUrl}/documents/getByCriteria'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final listItems = jsonData["items"] as List;
        final listDocuments = listItems.map(
                (json) => DocumentModel.fromJson(json)
        ).toList();
        return listDocuments;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}