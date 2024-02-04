
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/controller/profil_page_controller.dart';

class ProfilPageEdit extends StatelessWidget {
  ProfilPageEdit() ;



  CollectionReference collectionReference= FirebaseFirestore.instance.collection('collectionPathsms');

  @override
  Widget build(BuildContext context) {




    return Scaffold(
          appBar:AppBar(
            actions: [
              Center(child: Text("Profil Page              "))
            ],
          ),
          body: Obx(() {
            return getBody(context);
          },)

          //
        );

  }

  Widget getBody( BuildContext context) {
    ProfilePageController profilePageController=Get.find<ProfilePageController>();

        return Scaffold(
          resizeToAvoidBottomInset: true,

          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              child: ListView(
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(

                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.width*0.4,
                    decoration:profilePageController.pickedImage.value!=null? BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: FileImage(File(profilePageController.pickedImage.value!.path))
                      )
                    ):null,
                  ),  // rasm
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  ElevatedButton(onPressed: () async{
                   profilePageController.imageLoad();
                  }, child: Text("select Image")), //rasmni pick qilish

                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(
                      controller: profilePageController.textEditingControllerDisplayName,
                      decoration: InputDecoration(
                          hintText: "DisplayName",
                          border: OutlineInputBorder(
                          )
                      ),

                    ),
                  ),SizedBox(height: 15,),  //Name textField
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(
                      controller: profilePageController.textEditingControllerEmail,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                          )
                      ),

                    ),
                  ),SizedBox(height: 15,),  //PhoneNumber textField
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextField(
                      controller: profilePageController.textEditingControllerPassword,
                      decoration: InputDecoration(
                          hintText: "new Password",
                          border: OutlineInputBorder(
                          )
                      ),

                    ),
                  ),SizedBox(height: 15,),  //Display name textField
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                  InkWell(
                    onTap: () async{
                      await profilePageController.updateProfile();
                      Get.offNamed('/profilPageInfor');
                    },
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width*0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),color: Colors.blue
                        ),
                        child:  Center(child: Text("update Profile",style: TextStyle(fontSize: 20,color: Colors.white))),
                    ),
                  )
                                            // Button
                ],
              ),
            ),
          ),
          //

        );
      }
    }

