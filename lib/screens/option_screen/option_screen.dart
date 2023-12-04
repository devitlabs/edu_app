import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
