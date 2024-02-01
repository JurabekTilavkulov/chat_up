import 'package:chat_up/data/utils/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/register_login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  RegisterLoginController fireBaseController=Get.find<RegisterLoginController>();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: getBody(context),
        )
    );
  }

  getBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 240,
                width: 379,
                // color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocalKeys.hello.tr, style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 48,
                      letterSpacing: 0.12,),),
                    Text('${LocalKeys.again.tr}!', style: TextStyle(fontWeight: FontWeight.w700,
                        letterSpacing: 0.12,
                        fontSize: 48,
                        color: Colors.blue),),
                    Text(LocalKeys.welcome.tr, style: TextStyle(
                        color: Color(0xFF4E4B66),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),)
                  ],
                ),
              ),
/*The RichText widget is used to display text that uses various different styles.
The displayed text is described using a tree of TextSpan objects, each of which
has its own associated style that is used for that subtree. */
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text:LocalKeys.username.tr,
                            style: TextStyle(
                              color: Color(0xFF4E4B66), fontSize: 14,)
                        ),
                        TextSpan(text: '*',
                            style: TextStyle(color: Colors.red, fontSize: 14,)
                        )
                      ]
                  )
              ),
              SizedBox(
                height: 4,
              ),
              /*It is a second TextField type. It provides a way to group multiple form fields together,
                 perform validation on those fields, and manage their state.   */
              Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          fireBaseController.emaillogin(email: value);
                          if (value == null || value.isEmpty) {
                            return LocalKeys.please.tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: LocalKeys.password.tr,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),

                      )
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: LocalKeys.password.tr,
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
                height: 4,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          fireBaseController.passwordlogin(password: value);
                          if (value == null || value.isEmpty) {
                            return LocalKeys.passwordEnter.tr;
                          }
                          return null;
                        },
                        //obscureText:state.isEyeShow ?? false,
                        decoration: InputDecoration(
                            hintText:LocalKeys.password.tr,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // context.read<SplashCubit>().isShowPassword((state.isEyeShow??false));
                              },
                              icon: Icon((false)
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )
                        ),
                      )
                    ],
                  )),


              Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.zero,
                    child: Checkbox(
                        value: false, //state.chekBox??
                        activeColor: Colors.blue,
                        tristate: true,
                        onChanged: (d) {
                          // context.read<SplashCubit>().isShowChekbox(state.chekBox??false);
                          // d=state.chekBox;
                        }),
                  ),),
                  Text(LocalKeys.remember.tr,
                    style: TextStyle(color: Color(0xFF4E4B66),),),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(LocalKeys.remPasword.tr,
                        style: TextStyle(color: Colors.blue),))

                ],
              ),
              SizedBox(
                height: 16,
              ),
              MaterialButton(
                color: Colors.white,
                onPressed: () {
                  fireBaseController.loginEnter();
                  if (_formKey.currentState!.validate() &&
                      _formKey1.currentState!.validate()) {
                   // Navigator.pushNamed(context, '/forgotPage');
                  }
                },
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Container(
                  width: 380,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text(
                      LocalKeys.login.tr, style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(LocalKeys.continueT.tr,
                  style: TextStyle(color: Color(0xFF4E4B66), fontSize: 14,),),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: MaterialButton(onPressed: () {},
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Container(
                      width: 160,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFEEF1F4),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/png/img_1.png', width: 24,
                              height: 24,),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Facebook',
                              style: TextStyle(color: Color(0xFF667080),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,),)
                          ],),),

                    ),),),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(child: MaterialButton(onPressed: () {},
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Container(
                      width: 160,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFEEF1F4),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/png/img_2.png', width: 24,
                              height: 24,),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Google',
                              style: TextStyle(color: Color(0xFF667080),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LocalKeys.account.tr,
                    style: TextStyle(color: Color(0xFF667080)),),
                  TextButton(onPressed: () {
                   Get.toNamed('/registerPage');
                  },
                      child: Text(LocalKeys.Sign.tr, style: TextStyle(
                        color: Color(0xFF1877F2),
                        fontWeight: FontWeight.w600,),))
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}

