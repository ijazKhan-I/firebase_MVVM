

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils{

  //This Method is using in TextField for Focus
  static fieldFocusChange(BuildContext context,
      FocusNode current,
      FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);


  }

  //This Method is used to show toast message
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  //This Method is used to show flushBar like SnakeBar
  static showFlushBar(String message,BuildContext context){
    Flushbar(
      title: "Error",
      message: message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  //This Method is used to show Flutter SnakeBar
  static showSnakeBar(String message, BuildContext context) {
    //First create snakeBar and then use ScaffoldMessenger to show snakeBar
    SnackBar snackBar=SnackBar(content:Text(message),
      backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}