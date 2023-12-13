import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SimulateurOrientationScreen extends StatefulWidget {
  const SimulateurOrientationScreen({super.key});

  @override
  State<SimulateurOrientationScreen> createState() => _SimulateurOrientationScreenState();
}

class _SimulateurOrientationScreenState extends State<SimulateurOrientationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
              context.go("/app-menu/accueil");
          },splashRadius: 20,
        ),
        title: Text("Simulateur d'orientation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Moyenne d'orientation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                IconButton(onPressed: (){}, icon: Icon(Icons.refresh),splashRadius: 20,)
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFCCECF9),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          width:160,
                          child: Text("Matières",style: TextStyle(fontSize: 14),)
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                            child: Container(
                              width:100,
                              child: Text("MA/20",style: TextStyle(fontSize: 12),)
                        )),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                            width:100,
                            child: Text("BEPC/20",style: TextStyle(fontSize: 12),)
                        )),
                        SizedBox(width: 15,),
                      ],
                    ),
                  ),
                  Container(
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
                          child: Text("Composition Française"),
                        ),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Center(
                            child:  Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: TextFormField(
                                initialValue: "0",
                                maxLength: 5,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\,?\d{0,2}')), // Allow up to 2 decimal places
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black, fontSize: 14),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                },
                              ),
                            ),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Container(
                          width: 15,
                          child: Center(
                            child: Text("x2",style: TextStyle(color: Colors.black,fontSize: 14),),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
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
                          child: Text("Mathématiques"),
                        ),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Container(
                          width: 15,
                          child: Center(
                            child: Text("x2",style: TextStyle(color: Colors.black,fontSize: 14),),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
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
                          child: Text("Sciences Physiques"),
                        ),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Container(
                          width: 15,
                          child: Center(
                            child: Text("x2",style: TextStyle(color: Colors.black,fontSize: 14),),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
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
                          child: Text("Anglais"),
                        ),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0",style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                        )),
                        SizedBox(width: 5,),
                        Container(
                          width: 15,
                          child: Center(
                            child: Text("x2",style: TextStyle(color: Colors.black,fontSize: 14),),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
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
                              color: Color(0xFF59C1EB),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("Moyenne d'orientation"),
                        ),
                        SizedBox(width: 5,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF0A1E64),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Center(
                            child: Text("0 / 20",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                        )),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
