import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffB81736),
                  Color(0xff281537),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Hello\nSign in!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 180),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child:  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      onTapOutside: (_){
                        FocusScope.of(context).unfocus();
                      },
                      cursorColor: const Color(0xFF757575),
                      controller: authController.login,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: OutlineInputBorder(),
                          label: Text('Login',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xffB81736),
                          ),)
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onTapOutside: (_){
                        FocusScope.of(context).unfocus();
                      },
                      cursorColor: const Color(0xFF757575),

                      controller: authController.password,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:BorderSide(color: Colors.black, width: 0.0),
                          ),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                          label: Text('Password',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xffB81736),
                          ),)
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password?',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff281537),
                      ),),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: (){
                        authController.signIn(context);
                        // print(login.text);
                        // print(password.text);
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(login.text,style: const TextStyle(color: Colors.white),)));

                      },
                      child: Container(
                        height: 40,
                        width: size.width*0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xffB81736),
                                Color(0xff281537),
                              ]
                          ),
                        ),
                        child: const Center(child: Text('SIGN IN',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),),),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ));
  }
}