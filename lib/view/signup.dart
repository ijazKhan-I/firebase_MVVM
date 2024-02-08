import 'package:firebase_mvvm/Utils/utils.dart';
import 'package:firebase_mvvm/resources/Round_Button.dart';
import 'package:firebase_mvvm/view_model/Auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  //Controllers
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController schoolNameController=TextEditingController();

  //Focus node
  FocusNode schoolNamedFocus=FocusNode();
  FocusNode emailFocus=FocusNode();
  FocusNode passwordFocus=FocusNode();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height*1;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: schoolNameController,
                keyboardType: TextInputType.emailAddress,
                focusNode: schoolNamedFocus,
                decoration: InputDecoration(
                  labelText: "School Name",
                  hintText: "School Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onFieldSubmitted: (value){
                  FocusScope.of(context).requestFocus(emailFocus);
                },
              ),
              SizedBox(height: height*0.03,),
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
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                focusNode: passwordFocus,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onFieldSubmitted: (value){
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),
              SizedBox(height: height*0.03,),
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
                        }else if(schoolNameController.text.isEmpty){
                          Utils.showFlushBar("Please enter school name", context);
                        }else{
                          value.signUp(emailController.text, passwordController.text, schoolNameController.text);
                        }
                      });
                },

              ),
      
            ],
          ),
        ),
      ),
    );
  }
}
