import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../data/controller/sms_controller.dart';
import '../../../data/service/sms_service.dart';

class ChatPage extends StatelessWidget {
   ChatPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsController>(
        init:SmsController(SmsService()) ,
        builder: (SmsController controller){

      return bodyBuild(context,controller) ;

    } );

  }

  Widget bodyBuild(BuildContext context,SmsController controller){
    User? user= FirebaseAuth.instance.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.06,
            color: Colors.greenAccent,
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Get.toNamed('/loginPage');
                }, icon: Icon(Icons.backspace)),
                IconButton(onPressed: () {
                  Get.toNamed('/profilPageInfor');
                },
                  icon: Icon(Icons.person),),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height*0.8,
              color: Color(0xff867373),
              // color: Colors.green,
              child: StreamBuilder(
                stream:controller.getAllText(),
                builder: (context, snapshot) {

                  print('snapshot user=${snapshot.data?.docs[0]['user']}');
                  print(' user=${user?.email}');

                  if(snapshot.connectionState==ConnectionState.active){
                    List<QueryDocumentSnapshot<Object?>>? list=[];
                    list=snapshot.data?.docs;
                    if(list!=null){
                      list.sort((a, b) {
                        return a["dataTime"].compareTo(b["dataTime"]);
                      },);
                    }

                    return ListView.builder(
                      itemBuilder:  (context, index) {

                        Timestamp time=list?[index]['dataTime'];
                        DateTime date=DateTime.fromMillisecondsSinceEpoch(time.millisecondsSinceEpoch);

                        bool b= list?[index]['user']==user?.email;

                        return Container(
                        width:MediaQuery.of(context).size.width,

                        margin: EdgeInsets.all(8),

                          alignment: b?Alignment.centerRight:Alignment.centerLeft,

                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,

                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: b?Radius.circular(20):Radius.circular(0),
                              bottomRight:b? Radius.circular(0):Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                                color:b? Color(0xffbffa9f):Color(0xfffae4e4)),
                           // constraints: BoxConstraints(maxWidth:250),
                            child: Column(   children: [
                              Text("${list?[index]['user']}",style: TextStyle(color: Colors.indigo),),
                              list?[index]['rasm']!=null?Image.network('${list?[index]['rasm']}'):Text(''),
                              Text("${list?[index]['sms']}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                               Text(formatDate(date,[dd,'/',mm,'/',yyyy,' ',hh,':',nn]),style: TextStyle(fontSize: 10),)
                              ],)
                            ],
                            ),
                          ),
                        );
                      },
                      itemCount: list?.length??0,
                    );
                  }
                  if(snapshot.hasError) return Center(child: Text('Problams with snapshot'),);
                  else return Center(child: CircularProgressIndicator(),);
                },
              )
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.07,

            child:  TextField(
                decoration: InputDecoration(
                    hintText: "Message",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.sendText();
                      },
                      icon: Icon(Icons.send),
                    ),
                    prefixIcon: IconButton(onPressed: () async{
                      await controller.pickImageController();
                      showDialog(
                        context: context,
                        builder: (context){
                          print('showdialog controller.photoUrl=${controller.photoUrl}');
                        return SingleChildScrollView(
                          child: AlertDialog(
                            title: Text("send Photo"),
                            actions: [
                              Container(child: Image.file(File( controller.sendingImage.value!.path))),
                              TextField(
                                controller: controller.textEditingController,
                                  decoration: InputDecoration(
                                      hintText: "Message",
                                      border: OutlineInputBorder(),
                                       )
                                  ),

                              Row(children: [
                                TextButton(onPressed: () {
                                  Get.back();
                                }, child: Text("Cansel")),
                                TextButton(onPressed: () async{
                                  await controller.sendImageController();
                                  Get.back();
                                }, child: Text("Send")),
                              ],)
                            ],
                          ),
                        );
                      },);
                    },
                      icon: Icon(Icons.image),)
                ),
                controller: controller.textEditingController

            ),)


        ],),
      ),
    ) ;
      

  }
}
