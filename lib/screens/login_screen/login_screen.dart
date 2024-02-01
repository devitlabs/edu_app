import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/core/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/auth_controller.dart';
import '../../models/user_model.dart';
import '../../widgets/header_curved_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;

  final AuthController authController = Get.find();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  void _showErrorDialog(BuildContext context,String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.error_outline, // Use any error icon you prefer
                color: Colors.red, // Set the color of the error icon
              ),
              SizedBox(width: 10), // Add some spacing between icon and text
              Text('Erreur'), // Title text
            ],
          ),
          content: Text(message), // Error message content
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'), // Close button text
            ),
          ],
        );
      },
    );
  }

  void login() async {
    const storage = FlutterSecureStorage();
    setState(() {
      _isLoading = true;
    });
    final result = await ApiClient.login(login: _loginController.text,password: _passwordController.text);
    await Future.delayed(const Duration(seconds: 1));
    if (result != null) {
      if (result["hasError"]) {
        final message = result["status"]["message"];
        _showErrorDialog(context,message);
      } else {
        authController.user.value = UserModel.fromJson(result["items"][0]);
        DateTime date = DateTime.now();
        DateTime futureTime = date.add(const Duration(minutes: 25));

        await storage.write(key: "estConnecte", value: "true");
        await storage.write(key: "expiration", value: futureTime.toString());
        await storage.write(key: "login", value: _loginController.text);
        await storage.write(key: "motPasse", value: _passwordController.text);
        
        context.go("/app-menu");
      }
    } else {
      _showErrorDialog(context,"Une erreur est survenue lors de la connexion.");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hCircle = 150;
    final extraString = GoRouterState.of(context).extra.toString();
    if (extraString != null && extraString !="" && extraString !="null" ) {
      _loginController.text = extraString;
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 252,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: HeaderCurvedContainer(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 90,),
                      Container(
                        width: hCircle,height: hCircle,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor,width: 4),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child:  Image.asset("assets/logos/logo_app.png",width: 100,height: 100,),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const Text("Connexion",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 3 ) {
                            return 'Une erreur est survenue.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Login",
                            contentPadding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(
                                        context)
                                        .primaryColor,
                                    width: 2))),
                        controller: _loginController,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 5 ) {
                            return 'Le mot de passe doit avoir au moins 5 charactères.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Mot de passe",
                            contentPadding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(
                                        context)
                                        .primaryColor,
                                    width: 2))),
                        controller: _passwordController,
                      ),
                      const SizedBox(height:  10),
                      TextButton(onPressed: (){}, child: const Text(
                        "Mot de passe oublié ? ",style: TextStyle(color: Color(0xFFE45726)),)),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: _isLoading ? null : (){
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: _isLoading ? Colors.grey : primaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: _isLoading ? const CircularProgressIndicator(color: Colors.white,) : const Text(
                              "CONNEXION",
                              style: TextStyle(fontSize: 16,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Nouveau chez 13.Edu ? ",style: TextStyle(fontSize: 15),),
                          InkWell(
                            onTap: (){
                              context.go("/inscription");
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Inscription",style: TextStyle(fontSize: 15,color: primaryColor),),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
