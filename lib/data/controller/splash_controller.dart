import 'package:chat_up/data/utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  User? user;

  @override
  void onInit() async{
    super.onInit();
    user=await FirebaseAuth.instance.currentUser;
    startTimer();
  }
   startTimer() {
    print("user email=${user?.email}");
    print("userType=${user.runtimeType}");
    Future.delayed(Duration(seconds: 5),(){
      //Get.offNamed(AppRoutes.languagePage);
      if(user?.email!=null){
        Get.offNamed(AppRoutes.chatPage);
      }
       if(user?.email==null){
        Get.offNamed(AppRoutes.languagePage); };
    });
   }
}