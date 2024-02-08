import 'package:firebase_mvvm/Utils/Routes/RoutesName.dart';
import 'package:firebase_mvvm/view_model/Auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/utils.dart';
import '../resources/Round_Button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  //Focus node
  FocusNode emailFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();
  //Use to hide and Unhidden password
  ValueNotifier<bool> flag=ValueNotifier<bool>(true);
  /*This Method is used to clean the resource(like RAM when we move
  to another screen) assign to data are widgets*/
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    flag.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    final height=MediaQuery.of(context).size.height*1;
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocus,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).requestFocus(passwordFocus);
              },
            ),
            SizedBox(height: height*0.03,),
            ValueListenableBuilder(valueListenable: flag, builder: (context,value,child){
              return  TextFormField(
                controller: passwordController,
                obscureText: flag.value,
                obscuringCharacter: "#",
                focusNode: passwordFocus,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    suffixIcon: InkWell(
                        onTap: (){
                          flag.value=!flag.value;
                        },
                        child:  Icon(flag.value?Icons.visibility_off:Icons.visibility)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )

                ),
              );
            }),
            SizedBox(height:height*0.03,),
            Consumer<AuthModel>(
              builder: (BuildContext context, value, Widget? child) {
                return RoundButton(
                    loading: value.loading,
                    title: "Login",
                    onPress:(){
                      if(emailController.text.isEmpty){
                        Utils.showFlushBar("Please enter Email", context);
                      }else if(passwordController.text.isEmpty){
                        Utils.showFlushBar("Please enter Password", context);
                      }else if(passwordController.text.length<6){
                        Utils.showFlushBar("Enter 6 characters password", context);
                      }else {


                        value.auth(context,emailController.text, passwordController.text);

                      }
                    });
              },

            ),
            SizedBox(height:height*0.03,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("sign up here=>"),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, RouteName.signup);

                },
                child: const Text("Sing up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
