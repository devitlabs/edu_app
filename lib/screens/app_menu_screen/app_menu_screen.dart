import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer_menu.dart';

class AppMenuScreen extends StatefulWidget {
  final Widget child;
  const AppMenuScreen({super.key, required this.child});

  @override
  State<AppMenuScreen> createState() => _AppMenuScreenState();
}

class _AppMenuScreenState extends State<AppMenuScreen> {

  int _currentIndex = 0;
  final listIndexName = ["accueil","classe","resultats"];

  final _kBottomNavItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home),label: "Accueil"),
    const BottomNavigationBarItem(icon: Icon(Icons.table_chart_rounded),label: "Classe"),
    const BottomNavigationBarItem(icon: Icon(Icons.area_chart),label: "Résultats"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("13.Edu"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 25,),splashRadius: 20,padding: EdgeInsets.zero,)
        ],
      ),
      drawer: const Drawer(
        child: DrawerMenu(),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: _kBottomNavItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
          context.go("/app-menu/${listIndexName[_currentIndex]}");
        },
      ),
    );
  }
}   
