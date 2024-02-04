import 'package:chat_up/data/controller/profil_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageInfor extends StatelessWidget {
   ProfilePageInfor({Key? key}) : super(key: key);
  ProfilePageController profilePageController=Get.find<ProfilePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [

      ],),
      body:Obx(() =>  buildBody(context)),
    );
  }
  Widget buildBody(BuildContext context){

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.95,
        child: ListView(children: [
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width*0.4,
            height: MediaQuery.of(context).size.width*0.4,
            decoration:profilePageController.urlImageprofile!=null? BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                   fit: BoxFit.contain,
                    image:NetworkImage(profilePageController.urlImageprofile.toString())
                )
            ):null,
          ),
          SizedBox(height: 10,),
          Text.rich(TextSpan(children: [
            TextSpan(text: '          DisplayName:'),
            TextSpan(text: '   ${profilePageController.displayNameProfile}',style: TextStyle(fontSize: 18)),
          ])),
          SizedBox(height: 10,),
          Text.rich(TextSpan(children: [
            TextSpan(text: '          Email:'),
            TextSpan(text: '    ${profilePageController.emailProfile}',style: TextStyle(fontSize: 18)),
          ])),
          SizedBox(height: 10,),
          Text.rich(TextSpan(children: [
            TextSpan(text: '          user uid:'),
            TextSpan(text: '\n${profilePageController.uid}',style: TextStyle(fontSize: 18)),
          ])),
          SizedBox(height: 50,),
          InkWell(
            onTap: () {
              Get.toNamed('/profilPage');
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),color: Colors.blue
              ),
              child:  Center(child: Text("Edit Profile?",style: TextStyle(fontSize: 20,color: Colors.white))),
            ),
          )
        ],),
      ),
    );
  }
}
