import 'package:flutter/material.dart';

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          // ajout d'image ici
          child: Image.asset('assets/images/Image1.jpg',
           fit: BoxFit.cover,
            width: 100,
             height: 100,),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular( 10.0),
          // ajout d'image ici
          child: Image.asset('assets/images/Image2.jpg',
           fit: BoxFit.cover,
            width: 100,
             height: 100,),
        )
      ],
    ),
    );
  }
}
