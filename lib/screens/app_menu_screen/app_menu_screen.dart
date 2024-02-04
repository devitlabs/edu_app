import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth_controller.dart';
import '../../core/api_client.dart';
import '../../models/user_model.dart';
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
    const BottomNavigationBarItem(icon: Icon(Icons.table_chart_rounded),label: "Ma Classe"),
    const BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: "Livret Scolaire"),
  ];

  final AuthController authController = Get.put(AuthController());

  void initUser() async {
    if (authController.user.value.userInfos["login"] != null ) {
      return ;
    }
    const storage = FlutterSecureStorage();
    final login = await storage.read(key: "login");
    final password = await storage.read(key: "motPasse");
    final result = await ApiClient.login(login: login!, password: password!);
    if (result != null && result["hasError"] != true ) {
      authController.user.value = UserModel(userInfos :result["items"][0]);
    }
  }

  @override
  void initState() {
    initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("13.Edu"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications,size: 25,),splashRadius: 20,padding: EdgeInsets.zero,)
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
