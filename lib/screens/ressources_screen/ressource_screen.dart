import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ressource_post_bac.dart';
import 'ressource_six_tle.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

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
          title: const Text("Blog - Ressources"),
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
