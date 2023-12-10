import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {

  bool? estEleve = null;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hCircle = 150;
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 252,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset('assets/images/img_option1.png'),
                  IconButton(onPressed: (){
                    context.go("/login");
                  }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 25,)),
                  Positioned(
                    left: -hCircle/2+width/2,
                      top: 100,
                      child: Container(
                        width: hCircle,height: hCircle,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor,width: 4),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child:  Image.asset("assets/logos/logo_app.png",width: 100,height: 100,),
                        ),

                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Commençons ! Veuillez choisir votre de type de profil : Encadreur ou Elève.",style: TextStyle(color: Colors.black,fontSize:16 ),),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionButton(name: "Elève",onTap: (){
                  setState(() {
                    estEleve = true;
                  });
                },image: "assets/icons/student.png",),
                OptionButton(name: "Encardreur",onTap: (){
                  setState(() {
                    estEleve = false;
                  });
                },image: "assets/icons/teacher.png",)
              ]
            ),
            const SizedBox(height: 20,),
            if (estEleve != null ) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Vous avez choisi le profil : ",style: TextStyle(fontSize: 16)),
                Text(estEleve == true ? "Elève" : "Encardreur",style: TextStyle(fontSize: 16,color: primaryColor),),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: OutlinedButton(
                  onPressed: estEleve == null ? null : (){
                    // if (estEleve != null ) {
                    //   inscriptionController.inscriptionModel.value.typeProfil = estEleve == true ? "Elève" : "Encardreur" ;
                    //   context.go("/inscription/step-2");
                    // }
                  },
                  child: Container(height: 40, width: double.infinity,
                    child: Center(child: Text("Suivant",style: TextStyle(fontSize: 16),)),
                  )),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}


class OptionButton extends StatefulWidget {
  final String name;
  final String image;
  final Function()? onTap;
  const OptionButton({super.key, required this.name, required this.image, this.onTap});

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset(widget.image,width: 80,height: 80,),
            ),
            const SizedBox(height: 5,),
            Text(widget.name,style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}

