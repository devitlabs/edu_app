import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class InscriptionScreenThree extends StatefulWidget {
  const InscriptionScreenThree({super.key});

  @override
  State<InscriptionScreenThree> createState() => _InscriptionScreenThreeState();
}

class _InscriptionScreenThreeState extends State<InscriptionScreenThree> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){ context.go("/inscription/step-2"); },splashRadius: 20,icon: Icon(Icons.arrow_back)),
                  Text("Inscription 3/3",style: TextStyle(fontSize: 22),),
                  SizedBox(width: 20,)
                ],
              ),
              SizedBox(height: 2,),
              Container(
                width: double.infinity,
                height: 5,
                color: const Color(0xFF0074E1).withOpacity(0.28),
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      height: 5,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text("Profil : ",
                            style: TextStyle(fontSize: 16),),
                          Text("Elève",
                            style: TextStyle(fontSize: 16,color: secondaryColor),),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Container(
                        width: 250,
                        height: 2,
                        color: Color(0xFFD9D9D9),
                      ),
                      SizedBox(height: 4,),
                      Text("Maintenant, veuillez charger une belle photo de vous.", style: TextStyle(color: Color(0xFFBBBBBB),fontSize: 15),),
                      SizedBox(height: 8,),
                      Container(
                        width: 80,
                        height: 80,
                        child: Stack(
                          children: [
                            Image.asset("assets/images/person_image.png"),
                            const Positioned(
                                top: 60,
                                left: 60,
                                child: Icon(Icons.edit)
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                ! GetUtils.isEmail(value)) {
                              return 'Svp veuillez entrer un e-mail correct.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Mot de passe",
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(
                                          context)
                                          .primaryColor,
                                      width: 2))),
                          controller: _emailController,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                ! GetUtils.isEmail(value)) {
                              return 'Svp veuillez entrer un e-mail correct.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Confirmer le mot de passe",
                              contentPadding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(
                                          context)
                                          .primaryColor,
                                      width: 2))),
                          controller: _emailController,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value){},activeColor: secondaryColor,),
                          SizedBox(width: 10,),
                          Text("Abonnement Premium",style: TextStyle(color: secondaryColor),)
                        ],
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                content: Container(
                                  width: 270,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Image.asset("assets/images/congrats.png",width: 60,height: 60,),
                                      SizedBox(height: 10),
                                      Text("Félicitions vous faites parti(e)s"),
                                      Text("de la famille 13.Edu"),
                                      SizedBox(height: 10),
                                      TextButton(
                                          onPressed: (){
                                            context.go("/login");
                                          },
                                          child: Text("Connectez-vous maintenant"))
                                    ],
                                  ),
                                ),
                              )
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(
                              "SOUMETTRE",
                              style: TextStyle(fontSize: 16,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
