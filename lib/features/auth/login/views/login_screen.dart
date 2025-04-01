import 'package:authentication/features/Screens/home_page/home_page.dart';
import 'package:authentication/features/auth/quick_login/view/quick_login.dart';
import 'package:authentication/features/auth/registers/views/register_screen.dart';
import 'package:authentication/features/auth/widgets.dart';
import 'package:authentication/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/curveclipper.dart';
import '../../../../widgets/textFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> logIn() async {
    try{
      final authProvider = AuthProvider();
      await authProvider.signIn(
        _emailController.text,
        _passwordController.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch (e){
      rethrow;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: TopRightCurveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.5,
                height: MediaQuery.of(context).size.height * 0.9,
                color: Colors.orange,
              ),
            ),
          ),
          // Your other widgets
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuickLogin())),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      const SizedBox(width: 8),
                      const Text('Back'),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                const Center(
                    child: Text('devrnz', style: TextStyle(fontSize: 24))),
                // ... your form fields
                const SizedBox(height: 50),
                TextFieldWidget(
                  text: 'Email',
                  hintText: 'Example@gmail.com',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  text: 'Password',
                  hintText: "Enter password",
                  controller: _passwordController,
                ),
                SizedBox(height: 30),
                customButton(
                  text: 'Login',
                  gradientColor: LinearGradient(
                    colors: [Colors.orange.shade200, Colors.orange.shade700],
                  ),
                  onPressed: logIn,
                ),
                SizedBox(height: 10),
                forgotPasswordText(text: 'Forgot password?'),
                SizedBox(height: 20),
                rowWidget(),
                SizedBox(height: 40),
                facebookLogin(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  //SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      "Register?",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
