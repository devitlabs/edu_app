import 'dart:convert';

class InscriptionModel {
  String? typeProfil;
  String? nom;
  String? email;
  String? prenom;
  String? login;
  String? ville;
  String? numeroTelephone;
  String? classe;
  String? etablissement;
  String? dateNaissance;
  String? matricule;
  String? motPasse;
  bool? estPremium;

  InscriptionModel({
    required this.typeProfil,
    required this.nom,
    required this.login,
    required this.email,
    required this.prenom,
    required this.ville,
    required this.numeroTelephone,
    required this.classe,
    required this.etablissement,
    required this.motPasse,
    required this.dateNaissance,
    required this.matricule,
    required this.estPremium,
  });

  factory InscriptionModel.fromRawJson(String str) => InscriptionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InscriptionModel.fromJson(Map<String, dynamic> json) => InscriptionModel(
    typeProfil: json["typeProfil"],
    nom: json["nom"],
    prenom: json["prenom"],
    ville: json["ville"],
    numeroTelephone: json["numeroTelephone"],
    classe: json["classe"],
    etablissement: json["etablissement"],
    motPasse: json["motPasse"],
    dateNaissance: json["dateNaissance"],
    matricule: json["matricule"],
    estPremium: json["estPremium"],
    login: json["estPremium"],
    email: json["mail"],
  );

  factory InscriptionModel.init() => InscriptionModel(
    typeProfil: null,
    nom: null,
    prenom: null,
    ville: null,
    numeroTelephone: null,
    classe: null,
    etablissement: null,
    motPasse: null,
    estPremium: null,
    dateNaissance: null,
    matricule: null,
    login: null,
    email: null,
  );

  Map<String, dynamic> toJson() => {
    "typeProfil": typeProfil,
    "nom": nom,
    "prenom": prenom,
    "ville": ville,
    "numeroTelephone": numeroTelephone,
    "classe": classe,
    "etablissement": etablissement,
    "motPasse": motPasse,
    "dateNaissance": dateNaissance,
    "matricule": matricule,
    "estPremium": estPremium,
  };
}
