import 'package:flutter/material.dart';


Widget customButton({
  required String text,
  Color color = Colors.white,
  VoidCallback? onPressed,
  LinearGradient? gradientColor,
  Color textColor = Colors.black,
  Border? borderColor,
  double? textFontSize,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: gradientColor,
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: borderColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
          ),
        ),
      ),
    ),
  );
}

Widget forgotPasswordText({required String text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(text),
    ],
  );
}

Widget rowWidget() {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'Or',
        ),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

Widget facebookLogin() {
  return SizedBox(
    height: 50,
    child: Row(
      children: [
        Container(
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          width: 320,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              'Login with Facebook',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
