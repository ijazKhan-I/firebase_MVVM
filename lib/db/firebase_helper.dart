import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseHelper{

  final auth = FirebaseAuth.instance;
  Future<void> logtin({required String email, required String password})async{
    try {
      final signin = auth.signInWithEmailAndPassword(
          email: email, password: password).then((value) {
            saveUserId(auth.currentUser!.uid);
            saveLogin(true);
          }).onError((error, stackTrace) {
            debugPrint("$error \n $stackTrace");
          });
    }on FirebaseAuthException catch (e){
      if(e.code == "wrong-password"){
        //Check all errors code and then display the accutrate messaeg to the user
        //Got it?
        Fluttertoast.showToast(msg: "Wrong Password");

      }

    }

  }

 Future<bool?> checkUser()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool('login') ?? false;
  }

  saveLogin(bool isLogin)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', isLogin);
  }
  Future<String?> getUserId()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  saveUserId(String uid)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
  }


}