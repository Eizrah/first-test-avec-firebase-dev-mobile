

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:activite_firebase/Modele/Redacteur.dart';
import 'package:activite_firebase/Gestion_Redacteur/ModifRedac.dart';
import 'package:activite_firebase/Gestion_Redacteur/SupprimerRedac.dart';

class Infosredac extends StatefulWidget {
  //final List<Redacteur> redacteurs;
  const Infosredac({super.key});

  @override
  State<Infosredac> createState() => _InfosredacState();
}

class _InfosredacState extends State<Infosredac> {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informations des rédacteurs",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFC61559),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
  stream: _firestore.collection('redacteurs').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Center(child: Text("Il y a un problème !"));
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    final redacteursDocs = snapshot.data!.docs;

    if (redacteursDocs.isEmpty) {
      return const Center(
        child: Text("Aucun rédacteur n'a été ajouté pour le moment."),
      );
    }

    return ListView.builder(
      itemCount: redacteursDocs.length,
      itemBuilder: (context, index) {
        final doc = redacteursDocs[index];
        final data = doc.data() as Map<String, dynamic>;
        final redacteur = Redacteur(
          nom: data['nom'] ?? '',
          specialite: data['specialite'] ?? '',
        );

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            title: Text("Nom : ${data['nom']}"),
            subtitle: Text("Spécialité : ${data['specialite']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () async {
                    final redacteurModifie = await Navigator.push<Redacteur>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ModifRedac(redacteur: redacteur),
                      ),
                    );

                    if (redacteurModifie != null) {
                      // Mettre à jour Firestore
                      await _firestore
                          .collection('redacteurs')
                          .doc(doc.id)
                          .update({
                        'nom': redacteurModifie.nom,
                        'specialite': redacteurModifie.specialite,
                      });
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final confirmation = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const Supprimerredac()),
                    );

                    if (confirmation == true) {
                      await _firestore.collection('redacteurs').doc(doc.id).delete();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  },
),

    );
  }
}

// }),
//       body: widget.redacteurs.isEmpty
//           ? const Center(
//               child: Text("Aucun rédacteur n'a été ajouté pour le moment."),
//             )
//           : ListView.builder(
//               itemCount: widget.redacteurs.length,
//               itemBuilder: (context, index) {
//                 final redacteur = widget.redacteurs[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: ListTile(
//                     title: Text("Nom : ${redacteur.nom}"),
//                     subtitle: Text("Spécialité : ${redacteur.specialite}"),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit, color: Colors.blue),
//                           onPressed: () => _modifierRedacteur(redacteur, index),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () => _supprimerRedacteur(index),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
