import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color(0xFF7D9BDF),
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bienvenue dans 13.Edu",style: TextStyle(color: Colors.black,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("13 Edu est une application permettant aux élèves d'avoir un suivi par leurs encadreurs. "
                      "Vous y trouverez également de nombreuses ressources pour vous orienter au mieux dans vos études.",
                  style: TextStyle(color: Colors.black,fontSize: 14,fontStyle: FontStyle.italic),)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              height: 200,
              width: double.infinity,
              child: AnnouncementSlider(),
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
            const SizedBox(height: 5,),
          ],
        ),
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
            Center(child: Text(widget.name,style: const TextStyle(fontSize: 12),)),
            if (widget.secondName!=null) Center(child: Text(widget.secondName!,style: const TextStyle(fontSize: 12),))
          ],
        ),
      ),
    );
  }
}


class AnnouncementSlider extends StatefulWidget {
  @override
  _AnnouncementSliderState createState() => _AnnouncementSliderState();
}

class _AnnouncementSliderState extends State<AnnouncementSlider> {
  final List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFSuDJTxLtPD7Ahz1g6BAjg5iIdx8bJhWwxg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFSuDJTxLtPD7Ahz1g6BAjg5iIdx8bJhWwxg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFSuDJTxLtPD7Ahz1g6BAjg5iIdx8bJhWwxg&usqp=CAU"
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                height: 250, // Hauteur fixe de 250 pixels pour chaque annonce
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
                (index) => buildIndicator(index),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}

