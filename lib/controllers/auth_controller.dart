import 'package:edu_app/models/user_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var user = UserModel(userInfos: {}).obs;
}