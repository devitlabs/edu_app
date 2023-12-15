import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFF0C46C4).withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bienvenue dans 13.Edu",style: TextStyle(color: Colors.white,fontSize: 18),),
                SizedBox(height: 5,),
                Text("13 Edu est une application permettant aux élèves d'avoir un suivi par leurs encadreurs. "
                    "Vous y trouverez également de nombreuses ressources pour vous orienter au mieux dans vos études.",
                style: TextStyle(color: Colors.white,fontSize: 14,fontStyle: FontStyle.italic),)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 300 ,
                  height: 175,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 300 ,
                  height: 175,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Mes Outils 13.Edu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeButton(
                  name: "Simulateur",
                  secondName: "d'orientation",
                  onTap: (){
                    context.go("/simulateur-orientation");
                  },
                  image: "assets/icons/calculatrice.png",
                ),
                HomeButton(
                  name: "Blog",
                  onTap: (){
                    context.go("/blog");
                  },
                  image: "assets/icons/bloguer.png",
                ),
                HomeButton(
                  name: "Soutien",
                  secondName: "scolaire",
                  onTap: (){
                    context.go("/soutien-scolaire");
                  },
                  image: "assets/icons/materiel-scolaire.png",
                )
              ]
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class HomeButton extends StatefulWidget {
  final String name;
  final String? secondName;
  final String image;
  final Function()? onTap;
  const HomeButton({super.key, required this.name, required this.image, this.onTap, this.secondName});

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  color: Color(0xFFEAF9F6),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(widget.image,fit: BoxFit.fill,),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Center(child: Text(widget.name,style: TextStyle(fontSize: 12),)),
            if (widget.secondName!=null) Center(child: Text(widget.secondName!,style: TextStyle(fontSize: 12),))
          ],
        ),
      ),
    );
  }
}

