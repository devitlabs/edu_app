import 'dart:convert';

class DocumentModel {
  final String description;
  final String extension;
  final int id;
  final int idRessources;
  final String libelle;
  final String nomFichier;
  final String typeDocumensLibelle;
  final String typeDocumentCode;
  final String typeDocumentFk;
  final String typeDocumentLibelle;

  DocumentModel({
    required this.description,
    required this.extension,
    required this.id,
    required this.idRessources,
    required this.libelle,
    required this.nomFichier,
    required this.typeDocumensLibelle,
    required this.typeDocumentCode,
    required this.typeDocumentFk,
    required this.typeDocumentLibelle,
  });

  factory DocumentModel.fromRawJson(String str) => DocumentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
    description: json["description"],
    extension: json["extension"],
    id: json["id"],
    idRessources: json["idRessources"],
    libelle: json["libelle"],
    nomFichier: json["nomFichier"],
    typeDocumensLibelle: json["typeDocumensLibelle"],
    typeDocumentCode: json["typeDocumentCode"],
    typeDocumentFk: json["typeDocumentFk"],
    typeDocumentLibelle: json["typeDocumentLibelle"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "extension": extension,
    "id": id,
    "idRessources": idRessources,
    "libelle": libelle,
    "nomFichier": nomFichier,
    "typeDocumensLibelle": typeDocumensLibelle,
    "typeDocumentCode": typeDocumentCode,
    "typeDocumentFk": typeDocumentFk,
    "typeDocumentLibelle": typeDocumentLibelle,


  };
}
