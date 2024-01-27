import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/firebase_controller.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({Key? key}) : super(key: key);
   FireBaseController fireBaseController=Get.find<FireBaseController>();

   final _formKey1 = GlobalKey<FormState>();
   final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:Center(
            child:getBody(context),
          )
      );


        }



  getBody( BuildContext context) {


      return Container(
        padding: EdgeInsets.only(left:24,right: 24),
        child:
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:25,
                  ),
                  Container(
                    height:155,
                    width:379,
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello!',style: TextStyle(fontWeight:FontWeight.w700,letterSpacing: 0.12,fontSize: 48,color: Colors.blue),),
                        Text('Signup to get Started',style: TextStyle(color: Color(0xFF4E4B66),fontSize: 20,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),


                  SizedBox(
                    height:4,
                  ),

                  SizedBox(height:16,),

                  Text.rich(
                      TextSpan(
                          children:[
                            TextSpan(
                                text: 'Email',
                                style: TextStyle(
                                  color: Color(0xFF4E4B66),
                                  fontSize: 14,
                                )
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )
                            )
                          ]
                      )
                  ),
                  SizedBox(
                    height:4,
                  ),
                  Form(
                      key: _formKey1,
                      child: Column(
                        children: [
                          TextFormField(

                            validator: (value){
                              fireBaseController.emailTextFormField(email: value);
                              if(value==null || value.isEmpty){

                                return 'Please enter some email';
                              }
                              return null;

                            },
                            decoration:InputDecoration(
                                hintText: 'Email',
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),

                          )
                        ],
                      )),
                  SizedBox(height:16,),

                  Text.rich(
                      TextSpan(
                          children:[
                            TextSpan(
                                text: 'Password',
                                style: TextStyle(
                                  color: Color(0xFF4E4B66),
                                  fontSize: 14,
                                )
                            ),
                            TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                )
                            )
                          ]
                      )
                  ),
                  SizedBox(
                    height:4,
                  ),
                  Form(
                      key: _formKey3,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              fireBaseController.passwordTextFormField(password: value);
                              if(value==null || value.isEmpty){

                                return 'Please enter some password';
                              }
                              return null;

                            },
                            obscureText: false,
                            decoration:InputDecoration(
                                hintText: 'Password',
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                suffixIcon:IconButton(
                                  onPressed:(){

                                  },
                                  icon: Icon( false
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                )
                            ),
                          )
                        ],
                      )),


                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        child: Checkbox(value:false,
                            activeColor: Colors.blue,
                            tristate: true,
                            onChanged:(d){

                            }),
                      ),
                      Text('Remember me',style: TextStyle(color: Color(0xFF4E4B66),),),
                      SizedBox(
                        width:50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MaterialButton(
                    color: Colors.white,
                    onPressed: (){
                      if ( _formKey1.currentState!.validate()
                          && _formKey3.currentState!.validate()) {
                        fireBaseController.register();

                      }
                    },
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(6)
                    ),
                    child: Container(
                      width: 380,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child:Center(
                        child: Text(
                          'Registor',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child:Text('or continue with',style: TextStyle(color: Color(0xFF4E4B66),fontSize: 14,),),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(child:MaterialButton(onPressed:(){},
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Container(
                          width: 160,
                          height: 48,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(6),
                            color: Color(0xFFEEF1F4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child:Row(
                              children: [
                                Image.asset("assets/png/img_1.png",width: 24,
                                  height: 24,),
                                SizedBox(
                                  width:10,
                                ),
                                Text('Facebook',style: TextStyle(color: Color(0xFF667080),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,),)
                              ],),),

                        ),),),

                      SizedBox(
                        width:30,
                      ),
                      Expanded(child: MaterialButton(onPressed:(){},
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child:Container(
                          width: 160,
                          height: 48,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(6),
                            color: Color(0xFFEEF1F4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child:Row(
                              children: [
                                Image.asset('assets/png/img_2.png',width: 24,
                                  height: 24,),
                                SizedBox(
                                  width:10,
                                ),
                                Text('Google',style: TextStyle(color: Color(0xFF667080),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,),)
                              ],),),

                        ),))

                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ? ',style: TextStyle(color: Color(0xFF667080)),),
                      TextButton(onPressed:(){
                        Navigator.pushReplacementNamed(context,'/loginPage');
                      }, child:Text('Login',style: TextStyle(color: Color(0xFF1877F2),fontWeight: FontWeight.w600,),))
                    ],
                  ),

                ],
              )
            ],

        )

      );
    }

}
