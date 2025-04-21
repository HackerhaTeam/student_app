import 'package:flutter/material.dart';

class CustomBackButtonItem extends StatelessWidget {
  const CustomBackButtonItem({
    super.key, required this.text,  required this.textStyle,
  });
final String text;

final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         text,
          style:textStyle,
        ),
       
      ],
    );
  }


}
