import 'package:flutter/material.dart';

import 'AppColors.dart';

class RoundButton extends StatelessWidget {
  final title;
  final loading;
  final VoidCallback onPress;

  const RoundButton({Key? key,
    required this.title,
    this.loading=false,
    required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Container(
        height:MediaQuery.of(context).size.height*0.09,
        width: double.infinity,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.roundButton_color,
        ),
        child: Center(child: loading?const CircularProgressIndicator(
          backgroundColor: Colors.red,
        ):Text(title)),
      ),
    );
  }
}
