import 'package:chat_up/data/controller/register_login_controller.dart';
import 'package:chat_up/data/controller/splash_controller.dart';
import 'package:chat_up/data/service/profile_service.dart';
import 'package:chat_up/data/service/register_login_service.dart';
import 'package:get/get.dart';

import '../controller/local_controller.dart';
import '../controller/profil_page_controller.dart';
import '../controller/sms_controller.dart';
import '../service/sms_service.dart';

void initControllers(){
  Get.put(SplashController(),permanent: true);
  Get.put(LocalController(),permanent: true);
  Get.put(RegisterLoginController(firebaseService: RegisterLoginService()));
  Get.put(ProfilePageController(profileService: ProfileService()));
}