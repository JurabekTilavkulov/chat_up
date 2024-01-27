import 'package:chat_up/data/controller/firebase_controller.dart';
import 'package:chat_up/data/controller/splash_controller.dart';
import 'package:chat_up/data/service/firebase_service.dart';
import 'package:get/get.dart';

import '../controller/local_controller.dart';

void initControllers(){
  Get.put(SplashController(),permanent: true);
  Get.put(LocalController(),permanent: true);
  Get.put(FireBaseController(firebaseService: FirebaseService()));
}