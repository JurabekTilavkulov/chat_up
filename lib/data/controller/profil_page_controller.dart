
import 'package:chat_up/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../service/profile_service.dart';


class ProfilePageController extends GetxController{
  ProfilePageController({required this.profileService});
  final ProfileService profileService;
  TextEditingController textEditingControllerDisplayName =TextEditingController();
  TextEditingController textEditingControllerEmail =TextEditingController();
  TextEditingController textEditingControllerPassword =TextEditingController();

  var pickedImage=Rx<XFile?>(null);
  var _urlImageprofile=''.obs;
  var _emailProfile=''.obs;
  var _displayNameProfile=''.obs;
  var _uid=''.obs;

  get urlImageprofile => _urlImageprofile;
  get emailProfile => _emailProfile;
  get displayNameProfile => _displayNameProfile;
  get uid => _uid;


  @override
  void onInit() {
    super.onInit();
    readProfileInfor();
  }

  imageLoad()async{
    XFile? image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image!=null){
      image=XFile(image.path);
      pickedImage.value=image;
    }
  }


  updateProfile()async{
      await profileService.editProfile(
          pickedImage.value!,
          UserModel(
              displayName: textEditingControllerDisplayName.text,
              email: textEditingControllerEmail.text,
              password: textEditingControllerPassword.text
      ));
  }

  readProfileInfor()async{
    User? user=await profileService.readProfile();
    if(user!=null){
      _urlImageprofile.value=await user.photoURL!;
      _emailProfile.value=await user.email!;
      _displayNameProfile.value=await user.displayName!;
      _uid.value=await user.uid;
    }
  }
}