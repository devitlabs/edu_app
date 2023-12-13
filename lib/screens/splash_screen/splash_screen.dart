import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  final AuthController authController = Get.find();

  void initialisation() async {
    await Future.delayed(const Duration(seconds: 3));
    const storage = FlutterSecureStorage();
    final String? loggedIn = await storage.read(key: "estConnecte");
    if (loggedIn == "true") {
      context.go("/app-menu/accueil");
    } else {
      context.go("/login");
    }

  }

  @override
  void initState() {
    initialisation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logos/logo_app.png",width: 100,height: 100),
              SizedBox(height: 20,),
              const SizedBox(height: 40,width: 40,child: CircularProgressIndicator(),),
            ],
          ),
        ),
      ),
    );
  }

}
