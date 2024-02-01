import 'package:chat_up/data/controller/local_controller.dart';
import 'package:chat_up/data/utils/app_routes.dart';
import 'package:chat_up/data/utils/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    LocalController controller=Get.find<LocalController>();

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(LocalKeys.selectLanguage.tr)),), // tr -tarjima qilinadi
      bottomNavigationBar: TextButton(
          onPressed: () {
            Get.toNamed(AppRoutes.loginPage);
          }, child: Text(LocalKeys.next.tr,style: TextStyle(fontSize: 18),)),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                controller.changeLanguage(Locale("uz","UZ"));
              }, child: Text("UZ",style:TextStyle(color: controller.locale==Locale("uz","UZ")?Colors.red:Colors.grey,fontSize: 18),)),
              TextButton(onPressed: () {
                controller.changeLanguage(Locale("en","US"));
              }, child: Text("US",style:TextStyle(color: controller.locale==Locale("en","US")?Colors.red:Colors.grey,fontSize: 18),)),
              TextButton(onPressed: () {
                controller.changeLanguage(Locale("ru","RU"));
              }, child: Text("RU",style:TextStyle(color: controller.locale==Locale("ru","RU")?Colors.red:Colors.grey,fontSize: 18),)),
            ],
          ),
        );
      }),
    );
  }
}
