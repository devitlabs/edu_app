import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/screens/inscription_screen/inscription_screen_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class InscriptionScreenTwo extends StatefulWidget {
  const InscriptionScreenTwo({super.key});

  @override
  State<InscriptionScreenTwo> createState() => _InscriptionScreenTwoState();
}

class _InscriptionScreenTwoState extends State<InscriptionScreenTwo> {
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
                  IconButton(onPressed: (){context.go("/inscription");},splashRadius: 20,icon: Icon(Icons.arrow_back)),
                  Text("Inscription 2/3",style: TextStyle(fontSize: 22),),
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
                      width: 150,
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
                      Text("Veuillez renseigner les champs en grand caractère.  ", style: TextStyle(color: Color(0xFFBBBBBB),fontSize: 15),),
                      SizedBox(height: 4,),
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
                              hintText: "Nom",
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
                              hintText: "Prénom(s)",
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
                        padding: EdgeInsets.only(left: 20,right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFBBBBBB)),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ville",style: TextStyle(color: Color(0xFF646464)),),
                            IconButton(onPressed: (){},splashRadius: 15,padding: EdgeInsets.zero, icon: Icon(Icons.arrow_drop_down_outlined,color: Color(0xFF646464),size: 40,))
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
                              hintText: "Numéro Tel",
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
                        padding: EdgeInsets.only(left: 20,right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFBBBBBB)),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Classe",style: TextStyle(color: Color(0xFF646464)),),
                            IconButton(onPressed: (){},splashRadius: 15,padding: EdgeInsets.zero, icon: Icon(Icons.arrow_drop_down_outlined,color: Color(0xFF646464),size: 40,))
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 20,right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFBBBBBB)),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Etablissement",style: TextStyle(color: Color(0xFF646464)),),
                            IconButton(onPressed: (){},splashRadius: 15,padding: EdgeInsets.zero, icon: Icon(Icons.arrow_drop_down_outlined,color: Color(0xFF646464),size: 40,))
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Expanded(child: Container()),
                      OutlinedButton(onPressed: (){ context.go("/inscription/step-3"); }, child: Container(
                        height: 40,
                        width: double.infinity,
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
