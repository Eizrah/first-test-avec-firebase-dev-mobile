import 'package:flutter/material.dart';
class PartieIcon extends StatelessWidget {
  const PartieIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
         children: [
          Container(
            child: Column(
              children: [
                const Icon(
                  Icons.phone_android,
                  color: Colors.pink,
                ),
                SizedBox(height: 5),
                const Text(
                  "TELEPHONE",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
                  SizedBox(height: 5),
                const Text(
                  "EMAIL",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
             Container(
            child: Column(
              children: [
                const Icon(
                  Icons.share,
                  color: Colors.pink,
                ),
                  SizedBox(height: 5),
                const Text(
                  "PARTAGE",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}