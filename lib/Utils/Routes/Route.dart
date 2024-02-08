
import 'package:firebase_mvvm/Utils/Routes/RoutesName.dart';
import 'package:firebase_mvvm/view/signup.dart';
import 'package:firebase_mvvm/view/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/home_screen.dart';
import '../../view/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (BuildContext context) =>const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) =>const LoginScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=>const SingUp());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text("No"),
                ],
              ),
            ),

          );

        });
    }
  }
}