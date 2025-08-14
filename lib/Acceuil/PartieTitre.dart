import 'package:flutter/material.dart';

class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // petite marge autour du texte
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          const Text(
            'Bienvenue au Magazine Infos',
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
          ),
          
          
         
          const Text(
            'Votre magazine numérique, votre source d\'informations',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF000000),
              //essaie de mettre un petit decalage 
            ),
          ),
         // const SizedBox(height: 1), // espace entre les lignes de texte
        ],
      ),
    );
  }
}