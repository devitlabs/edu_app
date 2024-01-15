import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/core/api_client.dart';
import 'package:edu_app/models/inscription_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/inscription_controller.dart';

class InscriptionScreenThree extends StatefulWidget {
  const InscriptionScreenThree({super.key});

  @override
  State<InscriptionScreenThree> createState() => _InscriptionScreenThreeState();
}

class _InscriptionScreenThreeState extends State<InscriptionScreenThree> {

  late final TextEditingController _passwordController;
  late final TextEditingController _matriculeController;
  bool checkPremium = false;
  bool _obscureText = false;

  DateTime? selectedDate ;

  final _formKey = GlobalKey<FormState>();

  final InscriptionController inscriptionController = Get.find();

  @override
  void initState() {
    _passwordController = TextEditingController();
    _matriculeController = TextEditingController();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2013),
      firstDate: DateTime(1970),
      lastDate: DateTime(2013),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){ context.go("/inscription/step-2"); },splashRadius: 20,icon: const Icon(Icons.arrow_back)),
                  const Text("Inscription 3/3",style: TextStyle(fontSize: 22),),
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
                      width: 250,
                      height: 5,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
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
                      const SizedBox(height: 4,),
                      Container(
                        width: 250,
                        height: 2,
                        color: const Color(0xFFD9D9D9),
                      ),
                      const SizedBox(height: 4,),
                      const Text("Maintenant, veuillez charger une belle photo de vous.", style: TextStyle(color: Color(0xFFBBBBBB),fontSize: 15),),
                      const SizedBox(height: 8,),
                      SizedBox(
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
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 9 ) {
                              return "Le champ renseigné est incorrect";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
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
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text("Date de naissance : ${formatDate(selectedDate)}"),
                            IconButton(onPressed: (){
                              _selectDate(context);
                            }, icon: const Icon(Icons.date_range))
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length <= 6) {
                              return 'Le mot de passe doit avoir au moins de 6 chiffres.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Mot de passe",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                              ),
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
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty || value != _passwordController.text ) {
                              return 'Les mot de passe ne sont pas identiques.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Confirmer le mot de passe",
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
                        ),
                      ),
                      const SizedBox(height: 5,),
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
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate() ) {
                            inscriptionController.inscriptionModel.value.motPasse = _passwordController.text;
                            inscriptionController.inscriptionModel.value.estPremium = checkPremium;
                            inscriptionController.inscriptionModel.value.matricule = _matriculeController.text;
                            inscriptionController.inscriptionModel.value.dateNaissance = formatDate(selectedDate);
                            final result = await ApiClient.createUtilisateur(utilisateur: inscriptionController.inscriptionModel.value);
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
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text(
                              "SOUMETTRE",
                              style: TextStyle(fontSize: 16,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,)
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

  String formatDate(DateTime? date ) {
    if (date == null ) {
      return "";
    }

    String day = date.day < 10 ? "0${date.day}" :"${date.day}";
    String month = date.month < 10 ? "0${date.month}" :"${date.month}";

    return "$day/$month/${date.year}";
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
                      _passwordController.clear();
                      selectedDate = null;
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
