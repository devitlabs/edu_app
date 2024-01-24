import 'dart:math';

import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/inscription_controller.dart';

class InscriptionScreenTwo extends StatefulWidget {
  const InscriptionScreenTwo({super.key});

  @override
  State<InscriptionScreenTwo> createState() => _InscriptionScreenTwoState();
}

class _InscriptionScreenTwoState extends State<InscriptionScreenTwo> {

  String? login;
  final a = Random().nextInt(9);
  final b = Random().nextInt(9);
  late final TextEditingController _nomController;
  late final TextEditingController _emailController;
  late final TextEditingController _prenomController;
  late final TextEditingController _telController;
  late final TextEditingController _etablissementController;
  late final TextEditingController _villeController;
  String? _btnClasse;


  static const menuItemsClasse  = <String>['6ème', '5ème', '4ème', '3ème',
                                            '2nde', '1ère', 'Tle'];

  final InscriptionController inscriptionController = Get.find();

  final List<PopupMenuItem<String>> _popUpMenuItemsClasse = menuItemsClasse
      .map((String value) => PopupMenuItem<String>(value: value, child: Text(value),
    ),
  )
      .toList();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final inscriptionModel = inscriptionController.inscriptionModel.value;
    _nomController = TextEditingController(text: inscriptionModel.nom);
    _emailController = TextEditingController(text: inscriptionModel.email);
    _prenomController = TextEditingController(text: inscriptionModel.prenom);
    _telController = TextEditingController(text: inscriptionModel.numeroTelephone);
    _etablissementController = TextEditingController(text: inscriptionModel.etablissement);
    _villeController = TextEditingController(text: inscriptionModel.ville);
    _btnClasse = inscriptionModel.classe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){context.go("/inscription");},splashRadius: 20,icon: const Icon(Icons.arrow_back)),
                    const Text("Inscription 2/3",style: TextStyle(fontSize: 22),),
                    const SizedBox(width: 20,)
                  ],
                ),
                const SizedBox(height: 2,),
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
                const SizedBox(height: 5,),
                Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Column(
                        children: [
                           Row(
                            children: [
                              const Text("Profil : ",
                                style: TextStyle(fontSize: 16),),
                              Text("${inscriptionController.inscriptionModel.value.typeProfil}",
                                style: const TextStyle(fontSize: 16,color: secondaryColor),),
                            ],
                          ),
                          const SizedBox(height: 4,),
                          Container(
                            width: 250,
                            height: 2,
                            color: const Color(0xFFD9D9D9),
                          ),
                          const SizedBox(height: 4,),
                          const Text("Veuillez renseigner les champs ci-dessous.  ", style: TextStyle(color: Color(0xFFBBBBBB),fontSize: 15),),
                          const SizedBox(height: 4,),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty || !GetUtils.isEmail(value)) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
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
                              controller: _emailController,
                            ),
                          ),
                          const SizedBox(height: 4,),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length < 3) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Nom",
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
                              controller: _nomController,
                              onChanged: (value){
                                setState(() {
                                  setState(() {
                                    login = "$value$a$b".toLowerCase();
                                  });
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 4,),
                          Container(
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "$login",
                                style: const TextStyle(fontSize: 18,color: secondaryColor,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length < 4) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Prénom(s)",
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
                              controller: _prenomController,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              maxLength: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length < 4) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                 counterText: "",
                                  hintText: "Ville",
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
                              controller: _villeController,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length != 10) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Numéro Tel",
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
                              controller: _telController,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 20,right: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFFBBBBBB)),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(_btnClasse??"Classe",style: const TextStyle(color: Color(0xFF646464)),),
                                PopupMenuButton<String>(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.arrow_drop_down_outlined,color: Color(0xFF646464),size: 40,),
                                  onSelected: (String newValue) {
                                    setState(() {
                                      _btnClasse = newValue;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) => _popUpMenuItemsClasse,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
                          SizedBox(
                            height: 70,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length <  8) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Etablissement",
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
                              controller: _etablissementController,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          OutlinedButton(
                              onPressed: (){
                                if (_formKey.currentState!.validate() && _btnClasse != null ) {
                                  inscriptionController.inscriptionModel.value.nom = _nomController.text;
                                  inscriptionController.inscriptionModel.value.login = login;
                                  inscriptionController.inscriptionModel.value.email = _emailController.text;
                                  inscriptionController.inscriptionModel.value.prenom = _prenomController.text;
                                  inscriptionController.inscriptionModel.value.ville = _villeController.text;
                                  inscriptionController.inscriptionModel.value.numeroTelephone = _telController.text;
                                  inscriptionController.inscriptionModel.value.classe = _btnClasse;
                                  inscriptionController.inscriptionModel.value.etablissement = _etablissementController.text;
                                  context.go("/inscription/step-3");
                                }
                              },
                              child: const SizedBox(height: 40, width: double.infinity, child: Center(child: Text("Suivant",style: TextStyle(fontSize: 16),)),
                              )),
                          const SizedBox(height: 10,)
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
