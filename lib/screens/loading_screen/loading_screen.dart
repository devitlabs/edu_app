import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  final String? redirection;
  const LoadingScreen({super.key, this.redirection});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void routeToScreen() async{
    await Future.delayed(const Duration(seconds: 2));
    if (widget.redirection != null ) {
      context.go("${widget.redirection}");
    } else {
      context.go("/app-menu/accueil");
    }
  }

  @override
  void initState() {
    routeToScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logos/logo_app.png",width: 80,height: 80,),
            const SizedBox(height: 10,),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
