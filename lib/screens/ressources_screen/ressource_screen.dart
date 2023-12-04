import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ressource_post_bac.dart';
import 'ressource_six_tle.dart';

class RessourceScreen extends StatefulWidget {
  const RessourceScreen({super.key});

  @override
  State<RessourceScreen> createState() => _RessourceScreenState();
}

class _RessourceScreenState extends State<RessourceScreen> {

  final _kTabs = <Tab>[
    const Tab(text: 'Calculateur'),
    const Tab(text: '6ème - Tle'),
    const Tab(text: 'Post BAC'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ressources"),
          leading: IconButton(
              onPressed: () {
                context.go("/app-menu");
              },
              splashRadius: 20,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back)
          ),
          bottom: TabBar(
            indicatorColor: secondaryColor,
            indicatorWeight: 4,
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: [
            Text("Calculateur"),
            RessourceSixTle(),
            RessourcePostBAC(),
          ],
        ),
      ),
    );
  }
}
