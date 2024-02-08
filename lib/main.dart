import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_mvvm/Utils/Routes/RoutesName.dart';
import 'package:firebase_mvvm/view_model/Auth_model.dart';
import 'package:firebase_mvvm/view_model/userSession.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utils/Routes/Route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var hi=await Firebase.initializeApp();
  print(hi);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthModel()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
       initialRoute: RouteName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}


