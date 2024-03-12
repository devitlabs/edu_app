import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'gestion_concours.dart';
import 'gestion_ressource.dart';
import 'ressource_six_tle.dart';

class InfosScreen extends StatefulWidget {
  const InfosScreen({super.key});

  @override
  State<InfosScreen> createState() => _InfosScreenState();
}

class _InfosScreenState extends State<InfosScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Informations sur le système éducatif",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          SizedBox(
            height: 10,
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                notificationWidget(),
                notificationWidget(),
                notificationWidget()
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget notificationWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFCBD6E7),
      ),
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.school,color: Colors.blue,),
              Text("20/02/2023 16H25",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 14),)
            ],
          ),
          SizedBox(height: 10,),
          Text("Calendrier des examens scolaires 2023/2024 BAC & BEPC",style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          Text("Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum",style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.normal
          ),),
          SizedBox(height: 5,),
        ],
      ),
    );
  }


}
