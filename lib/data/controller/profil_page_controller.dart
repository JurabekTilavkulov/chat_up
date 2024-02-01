
import 'package:chat_up/data/models/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../service/profile_service.dart';


class ProfilePageController extends GetxController{
  ProfilePageController({required this.profileService});
  final ProfileService profileService;
  TextEditingController textEditingControllerDisplayName =TextEditingController();
  TextEditingController textEditingControllerPhoneNumber =TextEditingController();
  TextEditingController textEditingControllerName =TextEditingController();

  var pickedImage=Rx<XFile?>(null);

  imageLoad()async{
    XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image!=null){
      image=XFile(image.path);
      pickedImage.value=image;
    }
  }

  updateProfile()async{
      await profileService.upDateInfor(pickedImage.value!,ProfileModel1(
        name: textEditingControllerName.text,
        displayName: textEditingControllerDisplayName.text,
        phoneNumber: textEditingControllerPhoneNumber.text,));
  }
}