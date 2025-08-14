

import 'package:flutter/material.dart';
import 'package:activite_firebase/Modele/Redacteur.dart';

class ModifRedac extends StatefulWidget {
  final Redacteur redacteur;
  const ModifRedac({super.key, required this.redacteur});

  @override
  State<ModifRedac> createState() => _ModifRedacState();
}

class _ModifRedacState extends State<ModifRedac> {
  late TextEditingController _nomRedac;
  late TextEditingController _specRedac;

  @override
  void initState() {
    super.initState();
    _nomRedac = TextEditingController(text: widget.redacteur.nom);
    _specRedac = TextEditingController(text: widget.redacteur.specialite);
  }

  void _enregistrerModifications() {
    String nom = _nomRedac.text.trim();
    String specialite = _specRedac.text.trim();

    if (nom.isNotEmpty && specialite.isNotEmpty) {
      // Création d'une copie du rédacteur avec les nouvelles informations
      final redacteurModifie = widget.redacteur.copyWith(
        nom: nom,
        specialite: specialite,
      );
      // Retourne le rédacteur modifié
      Navigator.pop(context, redacteurModifie);
    }
  }
  
  @override
  void dispose() {
    _nomRedac.dispose();
    _specRedac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier le rédacteur", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC61559),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
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
                prefixIcon: Icon(Icons.psychology),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _enregistrerModifications,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, 
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(
                'Enregistrer les modifications',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
