import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../models/document_model.dart';
import '../models/inscription_model.dart';

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
        Uri.parse('$baseUrl/utilisateur/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,
      ).timeout(const Duration(seconds: 10),onTimeout: (){
        return http.Response("", 404);
      });

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

  static Future<String?> createUtilisateur({required InscriptionModel utilisateur }) async {
    try {
      var data = jsonEncode(
          {
            "user":"1",
            "datas":[
              {
                "nom": utilisateur.nom,
                "prenoms": utilisateur.prenom,
                "dateNaissance": utilisateur.dateNaissance,
                "pays": "Côte d'Ivoire",
                "email":utilisateur.email,
                "niveauEtude":utilisateur.classe,
                "login": utilisateur.login,
                "password": "${utilisateur.motPasse}",
                "telephone":utilisateur.numeroTelephone,
                "ville": utilisateur.ville,
                "description": "Pas de description",
                "typeUtuliseurFkx": "1",
                "matricule": utilisateur.matricule,
                "etat": "ETAT",
                "codeProfil": utilisateur.typeProfil == "Elève" ? "STANDART_APPRENANT" : "STANDART_FORMATEUR"
              }
            ]
          }
      );

      final response = await http.post(
        Uri.parse('$baseUrl/utilisateur/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData["hasError"]) {
          return "${utilisateur.login}";
        }
        return null;
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
        "data": {
        }
      });
      final response = await http.post(
        Uri.parse('$baseUrl/documents/getByCriteria'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,
      );
      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final listItems = jsonData["items"] as List;

        List<DocumentModel> result = [];

        for (var items in listItems ) {
          try {
            result.add(DocumentModel.fromJson(items));
          } catch (e) {
            continue ;
          }
        }

        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}