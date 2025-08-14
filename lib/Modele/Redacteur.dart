// Redacteur.dart
import 'package:uuid/uuid.dart';

class Redacteur {
  String? id; // UUID est une String, pas un int
  String nom;
  String specialite;

  static const uuid = Uuid();

  // Constructeur avec génération automatique de l'id
  Redacteur({
    required this.nom,
    required this.specialite,
  }) : id = uuid.v4();

  // Constructeur sans id (si besoin)
  Redacteur.sansId({
    required this.nom,
    required this.specialite,
  }) : id = null;

  // Constructeur avec id (utile pour fromJson)
  Redacteur.avecId({
    required this.id,
    required this.nom,
    required this.specialite,
  });

  // Méthode copyWith
  Redacteur copyWith({
    String? id,
    String? nom,
    String? specialite,
  }) {
    return Redacteur.avecId(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      specialite: specialite ?? this.specialite,
    );
  }

  // Conversion en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'specialite': specialite,
    };
  }

  // Création d'un objet à partir d'un JSON/Map
  factory Redacteur.fromJson(Map<String, dynamic> json) {
    return Redacteur.avecId(
      id: json['id'],
      nom: json['nom'],
      specialite: json['specialite'],
    );
  }
}
