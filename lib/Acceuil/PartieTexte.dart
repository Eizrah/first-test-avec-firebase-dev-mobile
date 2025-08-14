import 'package:flutter/material.dart';
class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),// petite marge 
      child: const Text(
       "Magazine Infos est bien plus qu'un simple magazine d'informations. C'est votre passerelle vers le monde , une source inestimable de connaissances  et d'actualitéq soigneisement séléctionnées pour vous éclairer sur les enjeux mondiaux, la culture, la science, et voir même le divertissement (le jeux)",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
    );
  }
}