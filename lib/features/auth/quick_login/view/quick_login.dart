import 'package:authentication/features/auth/login/views/login_screen.dart';
import 'package:authentication/features/auth/widgets.dart';
import 'package:flutter/material.dart';

import '../../registers/views/register_screen.dart';

class QuickLogin extends StatefulWidget {
  const QuickLogin({super.key});

  @override
  State<QuickLogin> createState() => _QuickLoginState();
}

class _QuickLoginState extends State<QuickLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'devrnz',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 60),
              customButton(
                text: 'Login',
                textFontSize: 18,
                textColor: Colors.orange,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              customButton(
                text: 'Register now',
                textFontSize: 18,
                textColor: Colors.white,
                color: Colors.transparent,
                borderColor: Border.all(color: Colors.white, width: 2),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Quick login with touch Id',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 80,
              ),
              SizedBox(height: 10),
              Text(
                "Touch Id",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
