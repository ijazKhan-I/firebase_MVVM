import 'package:firebase_mvvm/Utils/Routes/RoutesName.dart';
import 'package:firebase_mvvm/view/splash_screen/splash_services.dart';
import 'package:firebase_mvvm/view_model/userSession.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices slp = SplashServices();

  @override
    initState()  {
      super.initState();
      Future.delayed(Duration(seconds: 2), () {
        slp.checkLoginStatus(context);
      });
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RouteName.login);
          },
          child: Text("Splash screen"))),
    );
  }
}
