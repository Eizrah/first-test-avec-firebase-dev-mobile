// main.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:activite_firebase/Acceuil/Acceuil.dart';
import 'package:activite_firebase/Gestion_Redacteur/AjoutRedacteur.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MonAppli());
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      // La page d'accueil est la seule route nécessaire ici pour commencer
      home: const Acceuil(),
      // Les routes dynamiques seront gérées avec Navigator.push
      routes: {
        '/AjoutRedac': (context) => const Ajoutredacteur(),
      },
    );
  }
}