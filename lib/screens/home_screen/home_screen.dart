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
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFF0C46C4),
              borderRadius: BorderRadius.circular(10)
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bienvenue dans 13.Edu",style: TextStyle(color: Colors.white,fontSize: 18),),
                SizedBox(height: 5,),
                Text("The standard Lorem Ipsum passag Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: TextStyle(color: Colors.white,fontSize: 12),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",),
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",),
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",)
          //     ]
          // ),
          // SizedBox(height: 10,),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",),
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",),
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",)
          //     ]
          // ),
          // SizedBox(height: 10,),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       HomeButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",),
          //       Container(),
          //       Container()
          //     ]
          // ),
        ],
      ),
    );
  }
}

class HomeButton extends StatefulWidget {
  final String name;
  final String image;
  final Function()? onTap;
  const HomeButton({super.key, required this.name, required this.image, this.onTap});

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Color(0xFFEAF9F6),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset(widget.image,width: 60,height: 60,color: Colors.blue,),
            ),
            const SizedBox(height: 5,),
            Text(widget.name,style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}

