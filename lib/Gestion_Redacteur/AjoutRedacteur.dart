// AjoutRedacteur.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:activite_firebase/Modele/Redacteur.dart';

class Ajoutredacteur extends StatelessWidget {
  const Ajoutredacteur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un rédacteur", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC61559),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), // Pour rendre la flèche de retour blanche
      ),
      body: const Corps(),
    );
  }
}

class Corps extends StatefulWidget {
  const Corps({super.key});

  @override
  State<Corps> createState() => _CorpsState();
}

class _CorpsState extends State<Corps> {
  final TextEditingController _nomRedac = TextEditingController();
  final TextEditingController _specRedac = TextEditingController();

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
void _validerAjout() async { // 👈 3. Rendre la fonction async
    String nom = _nomRedac.text.trim();
    String specialite = _specRedac.text.trim();

    if (nom.isNotEmpty && specialite.isNotEmpty) {
      // 👇 4. Ajouter directement les données à Firestore
      await _firestore.collection('redacteurs').add({
        'nom': nom,
        'specialite': specialite,
      });
      // On retourne à la page précédente sans renvoyer de données
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("⚠️ Veuillez remplir tous les champs !"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nomRedac,
            decoration: const InputDecoration(
              labelText: 'Nom du rédacteur',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _specRedac,
            decoration: const InputDecoration(
              labelText: 'Spécialité',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.psychology), // Icône plus pertinente
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _validerAjout,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC61559),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text(
              'Ajouter le rédacteur',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}