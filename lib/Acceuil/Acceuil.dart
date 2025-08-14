// Acceuil.dart

import 'package:flutter/material.dart';
import 'package:activite_firebase/Acceuil/PartieTitre.dart';
import 'package:activite_firebase/Acceuil/PartieTexte.dart';
import 'package:activite_firebase/Acceuil/PartieIcon.dart';
import 'package:activite_firebase/Acceuil/PartieRubrique.dart';
import 'package:activite_firebase/Gestion_Redacteur/AjoutRedacteur.dart';
import 'package:activite_firebase/Gestion_Redacteur/InfosRedac.dart';
import 'package:activite_firebase/Modele/Redacteur.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  // La liste des rédacteurs est maintenant gérée ici
  //final List<Redacteur> _redacteurs = [];

    void _ajouterRedacteur() {
    Navigator.pushNamed(context, '/AjoutRedac');
  }

  // Méthode pour naviguer vers la liste des rédacteurs
  void _voirInfosRedacteurs() {
    Navigator.push(
      context,
      MaterialPageRoute(
        // ❌ Ne passez plus la liste en paramètre
        builder: (context) => const Infosredac(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magazine Infos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC61559),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFC61559),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu de Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Ajouter un Rédacteur'),
              onTap: () {
                Navigator.pop(context); // Ferme le drawer
                _ajouterRedacteur();
              },
            ),
            ListTile(
              title: const Text('Informations des Rédacteurs'),
              onTap: () {
                Navigator.pop(context);
                _voirInfosRedacteurs();
              },
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView( // Ajout de SingleChildScrollView pour éviter les erreurs de dépassement
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/MagazineInfos.jpg'),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            PartieTitre(),
            PartieTexte(),
            PartieIcon(),
            PartieRubrique(),
          ],
        ),
      ),
    );
  }
}