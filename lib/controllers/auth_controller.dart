import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/screens/home_page.dart';
import '../views/screens/login_page.dart';

class AuthController extends GetxController {

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    if(await getToken()== null){
      connected.value = false;
    }else{
      connected.value = true;
    }
    print(connected.value);
  }

  final TextEditingController login = TextEditingController(text: "mor_2314");
  final TextEditingController password = TextEditingController(text: "83r5^_");
  RxBool connected = false.obs;


  signIn(BuildContext context) async {
    var response = await http.post(Uri.parse('https://fakestoreapi.com/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": login.text,
          "password": password.text
        }));

    if (response.statusCode == 200) {
     String token = jsonDecode(response.body)['token'];
     storeToken(token);
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()),(Route<dynamic> route) => false);
     connected.value = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor:Colors.red,content: Text('Error',style: TextStyle(color: Colors.white),)));
    }
  }

  storeToken(String token)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getString('token');

  }

  logout(BuildContext context)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("token").then((value){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          LoginScreen()),(Route<dynamic> route) => false);
      connected.value = false;
    });

  }


}