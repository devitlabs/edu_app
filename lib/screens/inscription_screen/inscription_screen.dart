import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/screens/inscription_screen/inscription_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
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
                  IconButton(
                      onPressed: (){
                         context.go("/login");
                        },
                      splashRadius: 20,
                      icon: Icon(Icons.arrow_back)
                  ),
                  Text("Inscription 1/3",style: TextStyle(fontSize: 22),),
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
                      width: 100,
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
                      Text("Commençons ! Veuillez choisir votre de type de profil : Encadreur ou Elève.",
                      style: TextStyle(fontSize: 16),),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        height: 130,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: secondaryColor,width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/logos/logo_app.png",width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Center(
                              child: Text("Je suis un encadreurs et je souhaite poster du contenu en vue d’aider les élèves.",
                                style: TextStyle(fontSize: 14),),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 4,),
                      Container(
                        width: double.infinity,
                        height: 130,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFBBBBBB),width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/logos/logo_app.png",width: 50,height: 50,),
                            SizedBox(height: 5),
                            Center(
                              child: Text("Je suis un élève du secondaire ( 6ième à la Tle). Je souhaite utiliser 13 Edu pour renforcer mes acquis. ",
                                style: TextStyle(fontSize: 14),),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      OutlinedButton(
                          onPressed: (){
                            context.go("/inscription/step-2");
                          },
                          child: Container(height: 40, width: double.infinity,
                            child: Center(child: Text("Suivant",style: TextStyle(fontSize: 16),)),
                      )),
                      SizedBox(height: 10,)
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
