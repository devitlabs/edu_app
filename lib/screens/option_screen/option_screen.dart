import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
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
            SizedBox(height: 30,),
            Text("Choisissez votre profil",style: TextStyle(color: primaryColor,fontSize:16 ),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OptionButton(name: "Elève",onTap: (){ context.go("/login"); },image: "assets/icons/student.png",),
                OptionButton(name: "Encardreur",onTap: (){},image: "assets/icons/teacher.png",)
              ]
            )
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

