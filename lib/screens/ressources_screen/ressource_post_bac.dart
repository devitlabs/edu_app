import 'package:flutter/material.dart';

import 'card_ressource.dart';

class RessourcePostBAC extends StatefulWidget {
  const RessourcePostBAC({super.key});

  @override
  State<RessourcePostBAC> createState() => _RessourcePostBACState();
}

class _RessourcePostBACState extends State<RessourcePostBAC> {
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




