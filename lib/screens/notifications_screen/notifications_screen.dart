import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), splashRadius: 20, onPressed: () {
          context.go("/app-menu");
        },),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              notificationWidget(),
              notificationWidget(),
              notificationWidget()
            ],
          ),
        ),
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
              Icon(Icons.announcement,color: Colors.red,),
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
