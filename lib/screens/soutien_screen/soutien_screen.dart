import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SoutienScreen extends StatefulWidget {
  const SoutienScreen({super.key});

  @override
  State<SoutienScreen> createState() => _SoutienScreenState();
}

class _SoutienScreenState extends State<SoutienScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go("/app-menu");
            },
            splashRadius: 20,
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back)
        ),
        title: const Text("Soutien Scolaire"),
      ),
      body: const Center(
        child: Text("Demande d'encadrement"),
      ),
    );
  }
}
