import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 130,
            padding: const EdgeInsets.only(top: 25),
            color: const Color(0xFF0074E1),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: double.infinity,
                  child: Center(
                    child: Image.asset("assets/images/person_image.png",height: 80,width: 80,),
                  ),
                ),
                const Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HOUESSOU  HUEHANOU FABRICE ",style: TextStyle(fontSize: 16,color: Colors.white),),
                    SizedBox(height: 5,),
                    Text("+ 225 0757360442 ",style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Mon Profil : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        Text("Gratuit ",style: TextStyle(color: Color(0xFFBBBBBB),fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Icon(Icons.school,size: 40,color: primaryColor,),
            onTap: (){},
            title: Text("13 Academy ",style: TextStyle(fontSize: 20,color: Color(0xFF000000).withOpacity(0.7)),),
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Icon(Icons.book,size: 40,color: primaryColor,),
            onTap: () async {
              context.go("/ressources");
            },
            title: Text("Ressources",style: TextStyle(fontSize: 20,color: Color(0xFF000000).withOpacity(0.7)),),
          ),
          Divider(),
          ListTile(
            minVerticalPadding: 5,
            leading: Icon(Icons.help,size: 40,color: primaryColor,),
            onTap: (){},
            title: Text("Aide",style: TextStyle(fontSize: 20,color: Color(0xFF000000).withOpacity(0.7)),),
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Icon(Icons.star_rate_outlined,size: 40,color: primaryColor,),
            onTap: (){},
            title: Text("Notez 13.Edu",style: TextStyle(fontSize: 20,color: Color(0xFF000000).withOpacity(0.7)),),
          ),
          Expanded(child: Container()),
          Center(
            child: OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Se déconnecter",style: TextStyle(fontSize: 16,color: Colors.white),),
              ),
              onPressed: (){
                context.go("/login");
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Color(0xFFE45726)
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
