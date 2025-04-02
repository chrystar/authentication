import 'package:authentication/features/auth/login/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            _auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
