import 'dart:convert';

import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import 'gauge_widget.dart';

class OrientationSecondeScreen extends StatefulWidget {
  const OrientationSecondeScreen({super.key});

  @override
  State<OrientationSecondeScreen> createState() => _OrientationSecondeScreenState();
}

class _OrientationSecondeScreenState extends State<OrientationSecondeScreen> {

  final Map<String,num?> tableauNotes = {
    "fr1":null,
    "maths1":null,
    "pc1":null,
    "ang1":null,

    "fr2":null,
    "maths2":null,
    "pc2":null,
    "ang2":null,
    "ang3":null,
  };
  
  bool isShowMO = false;

  List<num> listNotes = [];

  final fr1Controller = TextEditingController();
  final maths1Controller = TextEditingController();
  final pc1Controller = TextEditingController();
  final ang1Controller = TextEditingController();

  final fr2Controller = TextEditingController();
  final maths2Controller = TextEditingController();
  final pc2Controller = TextEditingController();
  final ang2Controller = TextEditingController();
  final ang3Controller = TextEditingController();


  void initialisation() async {
    const storage = FlutterSecureStorage();
    final String? numbersString = await storage.read(key: "notes");
    if (numbersString != null ) {
      List<dynamic> dynamicList = jsonDecode(numbersString);
      List<num> numList = dynamicList.cast<num>();
      if (numList.length == 9 ) {

        fr1Controller.text =  numList[0].toString();
        maths1Controller.text = numList[1].toString();
        pc1Controller.text = numList[2].toString();
        ang1Controller.text = numList[3].toString();

        fr2Controller.text = numList[4].toString();
        maths2Controller.text = numList[5].toString();
        pc2Controller.text = numList[6].toString();
        ang2Controller.text = numList[7].toString();
        ang3Controller.text = numList[8].toString();
      }
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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            context.go("/app-menu/accueil");
          },splashRadius: 20,
        ),
        title: const Text("Orientation en Seconde A/C"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Moyenne d'orientation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.cleaning_services_outlined,color: Colors.red,),splashRadius: 20,),
                      IconButton(onPressed: (){
                        setState(() {
                          isShowMO = false;
                          listNotes = [];
                        });
                      }, icon: const Icon(Icons.refresh,color: Colors.green),splashRadius: 20,)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFCCECF9),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width:160,
                            child: Text("Matières",style: TextStyle(fontSize: 14),)
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                              child: SizedBox(
                                width:100,
                                child: Text("MA/20",style: TextStyle(fontSize: 12),)
                          )),
                          SizedBox(width: 5,),
                          Expanded(child: SizedBox(
                              width:100,
                              child: Text("BEPC/20",style: TextStyle(fontSize: 12),)
                          )),
                          SizedBox(width: 15,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 160,
                            padding: const EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Text("Composition Française"),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  controller: fr1Controller,
                                  maxLength: 5,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  controller: fr2Controller,
                                  maxLength: 5,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5,),
                          const SizedBox(
                            width: 15,
                            child: Center(
                              child: Text("x2",style: TextStyle(color: Colors.black,fontSize: 14),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 160,
                            padding: const EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Text("Mathématiques"),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  controller: maths1Controller,
                                  maxLength: 5,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),

                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  controller: maths2Controller,
                                  maxLength: 5,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5,),
                          const SizedBox(
                            width: 15,
                            child: Center(
                              child: Text("x2",style: TextStyle(color: Colors.black,fontSize: 14),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 160,
                            padding: const EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Text("Physique-Chimie"),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  maxLength: 5,
                                  controller: pc1Controller,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          )),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  controller: pc2Controller,
                                  maxLength: 5,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5,),
                          const SizedBox(
                            width: 15,
                            child: Center(
                              child: Text("x1",style: TextStyle(color: Colors.black,fontSize: 14),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 160,
                            padding: const EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              children: [
                                const Text("Anglais"),
                                const SizedBox(width: 20,),
                                Container(
                                  width: 2,
                                  height: 80,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 80,child: Column(
                                  children: [
                                    const Expanded(child: Center(child: Text("Ecrit")),),
                                    Container(
                                      width: double.infinity,
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    const Expanded(child: Center(child: Text("Oral")),),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child:  Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: TextFormField(
                                  controller: ang1Controller,
                                  maxLength: 5,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    hintText: "0",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(width: 5,),
                          Expanded(child: Column(
                            children: [
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0),
                                    child: TextFormField(
                                      controller: ang2Controller,
                                      maxLength: 5,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                      ],
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(color: Colors.black, fontSize: 14),
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        hintText: "0",
                                        counterText: "",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              const SizedBox(height: 5,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child:  Padding(
                                      padding: const EdgeInsets.only(bottom: 2.0),
                                      child: TextFormField(
                                        controller: ang3Controller,
                                        maxLength: 5,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                        ],
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(color: Colors.black, fontSize: 14),
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                          hintText: "0",
                                          counterText: "",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                          const SizedBox(width: 5,),
                          const SizedBox(
                            width: 15,
                            child: Center(
                              child: Text("x1",style: TextStyle(color: Colors.black,fontSize: 14),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              tableauNotes["fr1"] = convertStringToNum(fr1Controller.text);
                              tableauNotes["fr2"] = convertStringToNum(fr2Controller.text);
                              tableauNotes["ang1"] = convertStringToNum(ang1Controller.text);
                              tableauNotes["ang2"] = convertStringToNum(ang2Controller.text);
                              tableauNotes["ang3"] = convertStringToNum(ang3Controller.text);
                              tableauNotes["maths1"] = convertStringToNum(maths1Controller.text);
                              tableauNotes["maths2"] = convertStringToNum(maths2Controller.text);
                              tableauNotes["pc1"] = convertStringToNum(pc1Controller.text);
                              tableauNotes["pc2"] = convertStringToNum(pc2Controller.text);

                              bool allNotNull = tableauNotes.values.every((value) => value != null);
                              if (allNotNull) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Calcul ...')),
                                );
                                await Future.delayed(const Duration(seconds: 1));
                                List<num> nonNullValues = tableauNotes.values.where((value) => value != null).map((value) => value!).toList();
                                const storage = FlutterSecureStorage();
                                await storage.write(key: "notes", value: nonNullValues.toString());
                                setState(() {
                                  isShowMO = true;
                                  listNotes = nonNullValues;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                            child: const SizedBox(height: 40, width: 160, child: Center(child: Text("Calculer",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold))),
                          ),),
                          const SizedBox(width: 5,),
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFF0A1E64),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("${isShowMO ? calculerMoyenne(listNotes).toStringAsFixed(2) : "---" } / 20",style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          )),
                          const SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              if ( isShowMO )Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Votre moyenne d'orientation est : ",style: TextStyle(fontSize: 18),),
                      Text("${isShowMO ? calculerMoyenne(listNotes).toStringAsFixed(2) : "---" }/20",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  ResultatSimulateurBEPC(moBEPC: calculerMoyenne(listNotes).toDouble(),),
                  Row(
                    children: [
                      Image.asset("assets/icons/litteraire.png",width: 20,),
                      SizedBox(width: 10,),
                      Text("Bilan Littéraire : ",style: TextStyle(fontSize: 18),),
                      Text("12 / 20" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: primaryColor),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Image.asset("assets/icons/recherche-scientifique.png",width: 20,),
                      SizedBox(width: 10,),
                      Text("Bilan Scientifique : ",style: TextStyle(fontSize: 18)),
                      Text("08 / 20" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red,),)
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Divider(),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Image.asset("assets/icons/conseils.png",width: 25),
                      const SizedBox(width: 10,),
                      const Text("Conseils",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.verified,color: Colors.green,),
                          SizedBox(width: 5,),
                          Flexible(child: Text("Vous avez une forte chance d'être orienté en Seconde car votre MO = 12 ≥ 9.5 .",style: TextStyle(
                            fontSize: 16
                          ),))
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.verified,color: Colors.green,),
                          SizedBox(width: 5,),
                          Flexible(child: Text("Nous vous conseillons la SERIE C.",style: TextStyle(
                              fontSize: 16
                          ),))
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.verified,color: Colors.green,),
                          SizedBox(width: 5,),
                          Flexible(child: Text("Votre MO = 15 ≥  14. Ce qui signifie que vous êtes probablement un futur boursier.",style: TextStyle(
                              fontSize: 16
                          ),))
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  num? convertStringToNum(String? value) {
    if (value == null || value.isEmpty ) {
      return null;
    }
    String replacedString = value;
    if (value.contains(",")) {
      replacedString = value.replaceAll(',', '.');
    }
    num result = num.parse(replacedString);

    if (result > 20 ) {
      return null;
    }

    return result;
  }

  num calculerMoyenne(List<num> listNotes) {
    num average = (listNotes[0] + listNotes[4] ) * 2 +
                  (listNotes[1] + listNotes[5] ) * 2 +
                  (listNotes[2] + listNotes[6] ) +
                  ( listNotes[6] + (listNotes[7] + listNotes[8])/2) ;
    num result = average /12;
    return result;
  }
  
}
