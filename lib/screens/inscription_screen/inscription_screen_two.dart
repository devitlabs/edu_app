import 'dart:math';

import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/inscription_controller.dart';
import '../../core/api_client.dart';
import '../../models/inscription_model.dart';

class InscriptionScreenTwo extends StatefulWidget {
  const InscriptionScreenTwo({super.key});

  @override
  State<InscriptionScreenTwo> createState() => _InscriptionScreenTwoState();
}

class _InscriptionScreenTwoState extends State<InscriptionScreenTwo> {

  String? login;
  bool checkPremium = false;
  bool isShowPassword = true;
  String? motPasse ;
  final a = Random().nextInt(9);
  final b = Random().nextInt(9);
  final c = Random().nextInt(9);
  final d = Random().nextInt(9);
  late final TextEditingController _nomController;
  late final TextEditingController _emailController;
  late final TextEditingController _prenomController;
  late final TextEditingController _matriculeController;

  String? _btnClasse;


  static const menuItemsClasse  = <String>['6ème', '5ème', '4ème', '3ème',  '2nde', '1ère', 'Tle'];

  final List<PopupMenuItem<String>> _popUpMenuItemseEleve = menuItemsClasse.map(
        (String value) => PopupMenuItem<String>(value: value, child: Text(value),),
  ).toList();


  static const menuItemsEncadreur  = <String>['BAC', 'DEUG', 'LICENCE', 'MASTER'];

  final List<PopupMenuItem<String>> _popUpMenuItemsEncadreur = menuItemsEncadreur.map(
        (String value) => PopupMenuItem<String>(value: value, child: Text(value),),
  ).toList();


  final InscriptionController inscriptionController = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    motPasse = genererMotDePasse();
    _nomController = TextEditingController();
    _emailController = TextEditingController();
    _prenomController = TextEditingController();
    _matriculeController = TextEditingController();
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
                                    login = "$value$a$b$c$d".toLowerCase();
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
                                "Login : $login",
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
                                if (value == null || value.isEmpty || value.length < 9) {
                                  return "Le champ renseigné est incorrect";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                 counterText: "",
                                  hintText: "Matricule",
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
                              controller: _matriculeController,
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
                                Text(_btnClasse??"Niveau d'étude",style: const TextStyle(color: Color(0xFF646464),fontSize: 18)),
                                PopupMenuButton<String>(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.arrow_drop_down_outlined,color: Color(0xFF646464),size: 40,),
                                  onSelected: (String newValue) {
                                    setState(() {
                                      _btnClasse = newValue;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) =>
                                  inscriptionController.inscriptionModel.value.typeProfil == "Elève" ?  _popUpMenuItemseEleve : _popUpMenuItemsEncadreur                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Mot de passe : ",
                                        style: TextStyle(fontSize: 18,color: secondaryColor,fontWeight: FontWeight.bold),
                                      ),
                                      SelectableText(
                                        "${ isShowPassword ? motPasse : "**********" }",
                                        style: const TextStyle(fontSize: 18,color: secondaryColor,fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  IconButton(splashRadius: 20,onPressed: (){
                                    setState(() {
                                      isShowPassword = !isShowPassword;
                                    });
                                  }, icon: const Icon(Icons.visibility_sharp))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Checkbox(value: checkPremium,splashRadius: 10, onChanged: (value){
                                if (value != null ) {
                                  setState(() {
                                    checkPremium = value;
                                  });
                                }
                              },activeColor: secondaryColor,),
                              const SizedBox(width: 10,),
                              const Text("Abonnement Premium",style: TextStyle(color: secondaryColor),)
                            ],
                          ),
                          const SizedBox(height: 5,),
                          ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate() && _btnClasse !=null ) {
                                  final utulisateur = inscriptionController.inscriptionModel.value ;
                                  utulisateur.email = _emailController.text;
                                  utulisateur.nom = _nomController.text;
                                  utulisateur.prenom = _prenomController.text;
                                  utulisateur.matricule = _matriculeController.text;
                                  utulisateur.estPremium = checkPremium;
                                  utulisateur.login =  login;
                                  utulisateur.motPasse =  motPasse;
                                  utulisateur.classe =  _btnClasse;
                                  print(utulisateur.toJson());

                                  final result = await ApiClient.createUtilisateur(utilisateur: utulisateur);
                                  if (result != null ) {
                                    showSucces(result);
                                  } else {
                                    const snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Une erreur est survenue lors de la création de votre compte."),
                                      duration: Duration(seconds: 3), // Set the duration for the SnackBar
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                }
                              },
                              child: const SizedBox(height: 40, width: double.infinity, child: Center(child: Text("Soumettre",style: TextStyle(fontSize: 16),)),
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

  String genererMotDePasse() {
    Random random = Random();

    String majuscule = String.fromCharCode(random.nextInt(26) + 65);

    // Générer deux chiffres aléatoires
    String chiffre1 = random.nextInt(10).toString();
    String chiffre2 = random.nextInt(10).toString();

    // Générer cinq lettres minuscules aléatoires
    String minuscules = '';
    for (int i = 0; i < 5; i++) {
      minuscules += String.fromCharCode(random.nextInt(26) + 97);
    }

    // Concaténer les éléments générés pour former le mot de passe
    String motDePasse = '$majuscule$chiffre1$chiffre2$minuscules';

    return motDePasse;
  }

  void showSucces(String result) {
    showDialog(
        context: context,
        barrierDismissible: false,
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
                const SizedBox(height: 10),
                Image.asset("assets/images/congrats.png",width: 60,height: 60,),
                const SizedBox(height: 10),
                const Text("Félicitions vous faites parti(e)s"),
                const Text("de la famille 13.Edu. "),

                Row(
                  children: [
                    Text("Votre login est : "),
                    Text("${result}",style: TextStyle(fontWeight: FontWeight.bold,color: secondaryColor),),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: (){
                      _nomController.clear();
                      _prenomController.clear();
                      _emailController.clear();
                      _matriculeController.clear();
                      inscriptionController.inscriptionModel.value = InscriptionModel.init();
                      context.go("/login",extra: result);
                    },
                    child: const Text("Connectez-vous maintenant"))
              ],
            ),
          ),
        )
    );
  }
}
