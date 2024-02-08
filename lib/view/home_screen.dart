import 'package:firebase_mvvm/Model/userModel.dart';
import 'package:firebase_mvvm/Utils/Routes/RoutesName.dart';
import 'package:firebase_mvvm/resources/AppColors.dart';
import 'package:firebase_mvvm/view/indicator.dart';
import 'package:firebase_mvvm/view_model/Auth_model.dart';
import 'package:firebase_mvvm/view_model/userSession.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AuthModel>(context,listen: false);

    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SpinkitIndicator()));
          }, child: Text("SpinKit")),
          Expanded(
            child: FutureBuilder<void>(
              future: provider.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const  SpinKitChasingDots(
                    color: Colors.indigo,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display user profile data using userProfileProvider.userList
                  return ListView.builder(
                    itemCount: provider.userList.length,
                    itemBuilder: (context, index) {
                      UserModel user = provider.userList[index];
                      return ListTile(
                        onTap: (){
                          UserSession user=UserSession();
                          user.logout();
                          Navigator.pushNamed(context, RouteName.login);
                        },
                        title: Text("School Name:      ${user.schoolName} \n Email:  ${user.email}  "),

                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
