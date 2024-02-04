


import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';

class ProfileService{

  String? downLoadUrl;



  editProfile(XFile imageGallery, UserModel userModel)async{
    final userCredential=await FirebaseAuth.instance.currentUser;

    var storage=FirebaseStorage.instance.ref().child('profile_image/rasm.jpg'); //Firebase storagega saqlaydi rasmni
    var upload=storage.putFile(File(imageGallery.path));
    downLoadUrl=await(await upload).ref.getDownloadURL();  // String

    await userCredential?.updateDisplayName(userModel.displayName);
    await  userCredential?.updatePhotoURL(downLoadUrl);
    // await userCredential?.updateEmail(userModel.email!);
    // await userCredential?.updatePassword(userModel.password!);

  }
  Future<User?> readProfile()async{
    User? user=await FirebaseAuth.instance.currentUser;
    return user;
  }

}