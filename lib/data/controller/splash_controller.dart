import 'package:chat_up/data/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{


  @override
  void onInit() async{
    super.onInit();
    User? user=await FirebaseAuth.instance.currentUser;

    startTimer(user!);
  }
   startTimer(User user) {
    print("user email=${user.email}");
    print("userType=${user.runtimeType}");
    Future.delayed(Duration(seconds: 5),(){
      //Get.offNamed(AppRoutes.languagePage);
      if(user.email!=null){
        Get.offNamed(AppRoutes.chatPage);
      }
      else{Get.offNamed(AppRoutes.languagePage); };

      // LaguagePage ga sakraydi
    });
   }
}