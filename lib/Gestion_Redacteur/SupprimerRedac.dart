// SupprimerRedac.dart

import 'package:flutter/material.dart';

class Supprimerredac extends StatelessWidget {
  const Supprimerredac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Supprimer le rédacteur", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC61559),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Êtes-vous sûr de vouloir supprimer ce rédacteur ?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Ne retourne rien ou false pour annuler
                    Navigator.pop(context, false);
                  },
                  child: const Text("Annuler"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Retourne true pour confirmer la suppression
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    "Confirmer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}