import 'dart:convert';

class UserModel {
  CodeProfil? codeProfil;
  List<DatasActionFonctionnalite>? datasActionFonctionnalite;
  String? dateNaissance;
  String? description;
  String? etat;
  int? id;
  String? login;
  String? matricule;
  String? nom;
  String? pays;
  String? prenoms;
  CodeProfil? profilCode;
  CodeProfil? profilLibelle;
  int? typeUtuliseur;
  String? ville;

  UserModel({
    required this.codeProfil,
    required this.datasActionFonctionnalite,
    required this.dateNaissance,
    required this.description,
    required this.etat,
    required this.id,
    required this.login,
    required this.matricule,
    required this.nom,
    required this.pays,
    required this.prenoms,
    required this.profilCode,
    required this.profilLibelle,
    required this.typeUtuliseur,
    required this.ville,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    codeProfil: codeProfilValues.map[json["codeProfil"]]!,
    datasActionFonctionnalite: List<DatasActionFonctionnalite>.from(json["datasActionFonctionnalite"].map((x) => DatasActionFonctionnalite.fromJson(x))),
    dateNaissance: json["dateNaissance"],
    description: json["description"],
    etat: json["etat"],
    id: json["id"],
    login: json["login"],
    matricule: json["matricule"],
    nom: json["nom"],
    pays: json["pays"],
    prenoms: json["prenoms"],
    profilCode: codeProfilValues.map[json["profilCode"]]!,
    profilLibelle: codeProfilValues.map[json["profilLibelle"]]!,
    typeUtuliseur: json["typeUtuliseur"],
    ville: json["ville"],
  );


  factory UserModel.init() => UserModel(
    codeProfil: null,
    datasActionFonctionnalite: null,
    dateNaissance: null,
    description: null,
    etat: null,
    id: null,
    login: null,
    matricule: null,
    nom: null,
    pays: null,
    prenoms: null,
    profilLibelle: null,
    typeUtuliseur: null,
    ville: null,
    profilCode: null,
  );

  Map<String, dynamic> toJson() => {
    "codeProfil": codeProfilValues.reverse[codeProfil],
    "datasActionFonctionnalite": datasActionFonctionnalite?.map((x) => x.toString()).toList(),
    "dateNaissance": dateNaissance,
    "description": description,
    "etat": etat,
    "id": id,
    "login": login,
    "matricule": matricule,
    "nom": nom,
    "pays": pays,
    "prenoms": prenoms,
    "profilCode": codeProfilValues.reverse[profilCode],
    "profilLibelle": codeProfilValues.reverse[profilLibelle],
    "typeUtuliseur": typeUtuliseur,
    "ville": ville,
  };
}

enum CodeProfil {
  ADMIN
}

final codeProfilValues = EnumValues({
  "ADMIN": CodeProfil.ADMIN
});

class DatasActionFonctionnalite {
  CodeAction codeAction;
  String codeFonctionnalite;
  CodeProfil codeProfil;

  DatasActionFonctionnalite({
    required this.codeAction,
    required this.codeFonctionnalite,
    required this.codeProfil,
  });

  factory DatasActionFonctionnalite.fromRawJson(String str) => DatasActionFonctionnalite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatasActionFonctionnalite.fromJson(Map<String, dynamic> json) => DatasActionFonctionnalite(
    codeAction: codeActionValues.map[json["codeAction"]]!,
    codeFonctionnalite: json["codeFonctionnalite"],
    codeProfil: codeProfilValues.map[json["codeProfil"]]!,
  );

  Map<String, dynamic> toJson() => {
    "codeAction": codeActionValues.reverse[codeAction],
    "codeFonctionnalite": codeFonctionnalite,
    "codeProfil": codeProfilValues.reverse[codeProfil],
  };
}

enum CodeAction {
  CONSULTER,
  MODIFIER,
  SUPPRIMER
}

final codeActionValues = EnumValues({
  "Consulter": CodeAction.CONSULTER,
  "Modifier": CodeAction.MODIFIER,
  "Supprimer": CodeAction.SUPPRIMER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
