import 'dart:ffi';

import 'package:chat_up/data/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FireBaseController extends GetxController{

  final FirebaseService firebaseService;
  FireBaseController({required this.firebaseService});
  
  var _isLoading=false.obs;
  var _email=''.obs;
  var _passWord=''.obs;
  var _loginEmail=''.obs;
  var _loginPassword=''.obs;

  RxBool get isLoading => _isLoading;
  RxString get email => _email;
  RxString get passWord => _passWord;
  RxString get loginPassword => _loginPassword;
  RxString get loginEmail => _loginEmail;

  emailTextFormField({required String? email}){
    _email.value=email!;
  }
  passwordTextFormField({required String? password}){
    _passWord.value=password!;
  }
  passwordlogin({required String? password}){
    _loginPassword.value=password!;
  }
  emaillogin({required String? email}){
    _loginEmail.value=email!;
  }

  register() async {
    UserCredential? userCredential = await firebaseService.registerUser(
        _email.value, _passWord.value);
    // _isLoading.value=true; // Loading ketmoqda
    if (userCredential != null) {
      Get.offNamed('/loginPage');
    }
  }
    loginEnter() async {
      UserCredential? userCredential = await firebaseService.loginUser(
          _loginEmail.value, _loginPassword.value);
      if (userCredential != null) {
        Get.toNamed('/ChatPage');
      }

    }

}