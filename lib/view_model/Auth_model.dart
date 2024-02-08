import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_mvvm/Model/userModel.dart';
import 'package:firebase_mvvm/Utils/Routes/RoutesName.dart';
import 'package:firebase_mvvm/Utils/utils.dart';
import 'package:firebase_mvvm/exception/appexception.dart';
import 'package:firebase_mvvm/view_model/userSession.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier{
  FirebaseAuth _auth=FirebaseAuth.instance;
  List<UserModel> userList = [];
  bool loading=false;


  loadingGet(bool value){
    loading=value;
    notifyListeners();
  }


  Future<void> fetchData() async {
    userList = await fetchDataFromFirestore();
    notifyListeners();
  }
//This function for sign in
  Future<void> auth(BuildContext context,String email,String password)async {
    UserSession userSession=UserSession();
    loadingGet(true);
    try{
     await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        loadingGet(false);
        Navigator.pushNamed(context, RouteName.home);
        return Utils.toastMessage("Successfully login");

      });
     userSession.saveUserId(_auth.currentUser!.uid);

    }catch(e){
      if(e is FirebaseAuthException){
       AppException.handleAuthException(e);
       loadingGet(false);
      }else{
        print('Error: $e');
        loadingGet(false);
      }
    }
  }
//this function for sign up
Future<void> signUp(String email,String password,String schoolName) async{
    AppException.checkConnection();

  loadingGet(true);
  try {
    UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    try{
      var response =
      await FirebaseFirestore.instance.collection('school_list').add({
        'user_Id':_auth.currentUser!.uid,
        "schoolName":schoolName,
        "email":email,
        "password":password,
      });
      loadingGet(false);
      return Utils.toastMessage("Successfully Sign up");
    }catch(e){
      loadingGet(false);
    }
  } on FirebaseAuthException catch (e) {
    loadingGet(false);
    if (e.code == 'weak-password') {
      Utils.toastMessage("The password provided is too weak");
    } else if (e.code == 'email-already-in-use') {
      Utils.toastMessage("The account already exists for that email");
    }
  } catch (e) {
    loadingGet(false);
  }
}


  Future<List<UserModel>> fetchDataFromFirestore() async {
    List<UserModel> dataList = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('school_list')
        .where("user_Id", isEqualTo: _auth.currentUser!.uid)
        .get();

    querySnapshot.docs.forEach((doc) {
      UserModel data = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      dataList.add(data);
    });

    return dataList;
  }
}

