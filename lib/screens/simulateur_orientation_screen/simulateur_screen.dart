import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimulateurScreen extends StatefulWidget {
  const SimulateurScreen({super.key});

  @override
  State<SimulateurScreen> createState() => _SimulateurScreenState();
}

class _SimulateurScreenState extends State<SimulateurScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        context.go("/simulateur-seconde");
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Image.asset("assets/images/orientation.png", width: 110,),
                            SizedBox(height: 20,),
                            Text("Calculer votre moyenne d'orientenion en SECONDE Serie A/C ",textAlign: TextAlign.center,style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Image.asset("assets/images/universite.png", width: 110,),
                            SizedBox(height: 20,),
                            Text("Simulez votre orientation POST-BAC (Universités & Grandes Ecoles)",textAlign: TextAlign.center,style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
