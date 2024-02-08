

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_mvvm/Utils/utils.dart';

class AppException{

/*
This function is used to handle the
exception during the login
 */
 static handleAuthException(FirebaseAuthException e) {
    String errorMessage = '';

    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'Invalid email address';
        Utils.toastMessage(errorMessage);
        break;
      case 'invalid-credential':
        errorMessage = 'Invalid Credential';
        Utils.toastMessage(errorMessage);
        break;
      case 'user-not-found':
        errorMessage = 'User not found';
        Utils.toastMessage(errorMessage);
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password';
        Utils.toastMessage(errorMessage);
        break;
      case 'network-request-failed':
        errorMessage = 'No internet';
        Utils.toastMessage(errorMessage);
        break;
      default:
        errorMessage = 'Authentication failed. Please try again.';
        Utils.toastMessage(errorMessage);
    }

  }
  /*
  This function is used to handle and
  display message when internet is disable
   */
static checkConnection()async{
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    Utils.toastMessage("No internet connection. Please check your network.");
    return;
  }
}

}