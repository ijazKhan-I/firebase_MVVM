// import 'dart:html';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_mvvm/db/firebase_helper.dart';
// import 'package:firebase_mvvm/view/home_screen.dart';
// import 'package:firebase_mvvm/view/login_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SplashServices{
//   FirebaseHelper firebaseHelper = FirebaseHelper();
//
//   splashCheck(BuildContext context){
//     Future.delayed(Duration(seconds: 5),()async{
//       final loggedin = await firebaseHelper.checkUser() ?? true;
//
//       if(loggedin){
//         ///you will get all the data using uid and then navigate to home
//        final uid = await firebaseHelper.getUserId();
//
//        ///For example we have a method which get data from firebase firestore
//         ///we will pass simple the uid to hte method to get data. OK
//         ///e.g. [await getUserData(uid)]; //important
//         ///and then we will navigate to the Home Screen
//        ///I hope che os be deer clear shvi i
//        ///insha Allah sba be bia mazeed gup p lago
//
//         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
//
//       }else{
//         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen(),));
//       }
//     });
//   }
//
// }

import 'package:firebase_mvvm/view/home_screen.dart';
import 'package:firebase_mvvm/view/login_screen.dart';
import 'package:firebase_mvvm/view_model/userSession.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices{
  UserSession _session=UserSession();
  Future<void> checkLoginStatus(BuildContext context) async {
    bool isLoggedIn = await _session.isLoggedIn();
    if (isLoggedIn) {
      // User is logged in, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // User is not logged in, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

}
