import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/message_model.dart';
import '../service/sms_service.dart';

class SmsController extends GetxController{
  SmsController(this.smsService);
 final SmsService smsService;
  var sendingImage=Rx<XFile?>(null); //galleriyadan olingan rasm shu yerda
  var _photoSms=''.obs;
  var _photoUrl=''.obs;

  RxString get photoSms => _photoSms;
  RxString get photoUrl =>_photoUrl;
  TextEditingController textEditingController=TextEditingController();

  sendText() async{
    User? user=await FirebaseAuth.instance.currentUser;
    print('user.email =${user!.email}');
    smsService.addSms(MessageModel(user:user.email.toString(),dataTime:DateTime.now(),sms: textEditingController.text ) );

    textEditingController.text='';
  }
  Stream<QuerySnapshot<Object?>> getAllText(){
    return smsService.getSms();
  }

  pickImageController() async{  // image picker rasmni galleriyadan oladi
    XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image!=null){
      image=XFile(image.path);
      sendingImage.value=image;
    }
  }
  sendImageController()async{
    _photoSms.value=textEditingController.text;
    _photoUrl.value!= (await smsService.sendImage(sendingImage.value!,photoSms.value));
    print("_sms_controller _photoUrl=${photoUrl.value}");
    textEditingController.text='';
  }


}