

import 'package:chat_up/data/utils/app_routes.dart';
import 'package:chat_up/data/utils/init_controller.dart';
import 'package:chat_up/data/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'data/controller/local_controller.dart';

void main() async{
  //A fast, extra light and synchronous key-value in memory, which backs up data
  // to disk at each operation. It is written entirely in Dart and easily
  // integrates with Get framework of Flutter.
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initControllers();  // utils da aloxida yozilgan funksiya



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashPage,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      translations: Messages(),
      locale: Get.find<LocalController>().locale.value,  //bunda conrtollerni o'zi
      // izlab topib, tilni o'shandan oladi
      fallbackLocale: Locale('uz','UZ'), // xama narsa atkaz berganda Uzbek tiliga o'tadi
    );
  }
}

