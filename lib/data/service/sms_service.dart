

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../models/message_model.dart';

class SmsService{

  CollectionReference collectionReference= FirebaseFirestore.instance.collection('collectionPathsms');
  String? downLoadUrlImage;


  Future<void> addSms(MessageModel messageModel)async{
    collectionReference.add(messageModel.toJson()).then((value) => print("value=${value}"));
    print('collectionReference=${collectionReference}');
    print('collectionReference runtime=${collectionReference.runtimeType}');
    print('collectionReference snapshots runtime=${collectionReference.snapshots.runtimeType}');
    print('collectionReference snapshots =${collectionReference.snapshots}');
  }
  Stream<QuerySnapshot<Object?>> getSms() {
    return collectionReference.withConverter<MessageModel>(
        fromFirestore: (snapshot, options) {
          return MessageModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) => value.toJson()
    ).snapshots();
  }

  Future<String?> sendImage(XFile image,String sms)async{
    User? user=await FirebaseAuth.instance.currentUser;
    var date_time=DateTime.now().millisecondsSinceEpoch;
    var storage=FirebaseStorage.instance.ref().child('sending_image/${date_time.toString()}.jpg');
    var upload=storage.putFile(File(image.path));  //import 'dart:io';
    downLoadUrlImage=await (await upload).ref.getDownloadURL();
    collectionReference.add(MessageModel(user: user!.email.toString(), dataTime: DateTime.now(), sms: sms,rasm: downLoadUrlImage).toJson());
    return downLoadUrlImage;
  }

}