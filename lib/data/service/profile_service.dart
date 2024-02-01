


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../models/profile_model.dart';

class ProfileService{
  CollectionReference collectionReference= FirebaseFirestore.instance.collection('collectionPathProfile');
  String? downLoadUrl;

 upDateInfor(XFile imageGallery,ProfileModel1 profileModel1)async{  //
   var storage=FirebaseStorage.instance.ref().child('profile_images/rasm.jpg'); //Firebase storagega saqlaydi rasmni
   var upload=storage.putFile(File(imageGallery.path));
    downLoadUrl=await(await upload).ref.getDownloadURL();
   print('upload=${downLoadUrl}');

   collectionReference.add(ProfileModel1(
     name: profileModel1.name,
     displayName: profileModel1.displayName,
     phoneNumber: profileModel1.phoneNumber,
     photoURL: downLoadUrl  //storage ga saqlangan rasmni Photo url adresini FireBaseStore ga saqlaydi
   ).toJson());
  }

}