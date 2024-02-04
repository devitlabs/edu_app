import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth_controller.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  late final UserModel _user;

  final AuthController authController = Get.find();

  @override
  void initState() {
    _user = authController.user.value;
    super.initState();
  }


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
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${_user.userInfos["nom"]} ${_user.userInfos["prenoms"]}",style: const TextStyle(fontSize: 16,color: Colors.white),),
                    const SizedBox(height: 5,),
                    const Text("+225 0757360442 ",style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 5,),
                    const Row(
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
            leading: const Icon(Icons.school,size: 40,color: primaryColor,),
            onTap: (){},
            title: Text("13 Academy ",style: TextStyle(fontSize: 20,color: const Color(0xFF000000).withOpacity(0.7)),),
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: const Icon(Icons.book,size: 40,color: primaryColor,),
            onTap: () async {
              context.go("/blog");
            },
            title: Text("Blog",style: TextStyle(fontSize: 20,color: const Color(0xFF000000).withOpacity(0.7)),),
          ),
          const Divider(),
          ListTile(
            minVerticalPadding: 5,
            leading: const Icon(Icons.help,size: 40,color: primaryColor,),
            onTap: (){},
            title: Text("Aide",style: TextStyle(fontSize: 20,color: const Color(0xFF000000).withOpacity(0.7)),),
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: const Icon(Icons.star_rate_outlined,size: 40,color: primaryColor,),
            onTap: (){},
            title: Text("Notez 13.Edu",style: TextStyle(fontSize: 20,color: const Color(0xFF000000).withOpacity(0.7)),),
          ),
          Expanded(child: Container()),
          Center(
            child: OutlinedButton(
              onPressed: () async {
                const storage = FlutterSecureStorage();
                authController.user.value = UserModel(userInfos: {});
                await storage.deleteAll();
                context.go("/login");
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFE45726)
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Se déconnecter",style: TextStyle(fontSize: 16,color: Colors.white),),
              ),
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
