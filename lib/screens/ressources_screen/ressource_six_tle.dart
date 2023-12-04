import 'package:flutter/material.dart';

import 'card_ressource.dart';

class RessourceSixTle extends StatefulWidget {
  const RessourceSixTle({super.key});

  @override
  State<RessourceSixTle> createState() => _RessourceSixTleState();
}

class _RessourceSixTleState extends State<RessourceSixTle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: const Column(
          children: [
            CardRessource(title: "Ressource 1",),
            CardRessource(title: "Ressource 2",),
            CardRessource(title: "Ressource 3",),
          ],
        ),
      ),
    );
  }
}
