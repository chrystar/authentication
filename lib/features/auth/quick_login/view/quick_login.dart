import 'package:authentication/features/auth/login/views/login_screen.dart';
import 'package:authentication/features/auth/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import '../../registers/views/register_screen.dart';
import '../../../Screens/home_page/home_page.dart';

class QuickLogin extends StatefulWidget {
  const QuickLogin({super.key});

  @override
  State<QuickLogin> createState() => _QuickLoginState();
}

class _QuickLoginState extends State<QuickLogin> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  List<BiometricType> _availableBiometrics = <BiometricType>[];
  String _authorized = 'Not Authorized';

  @override
  void initState() {
    super.initState();
    _checkBiometrics().then((canCheck) {
      setState(() {
        _canCheckBiometric = canCheck;
      });
    });
    _getAvailableBiometrics().then((biometrics) {
      setState(() {
        _availableBiometrics = biometrics;
      });
    });
  }

  Future<void> _authenticatePressed() async {
    if (!_canCheckBiometric) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Biometric authentication is not available on this device.')),
      );
      return;
    }

    if (_availableBiometrics.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('No biometric methods are enrolled on this device.')),
      );
      return;
    }

    bool authenticated = await _authenticate();
    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });
  }

  Future<bool> _checkBiometrics() async {
    bool canCheck = false;
    try {
      canCheck = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    return canCheck;
  }

  Future<List<BiometricType>> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = <BiometricType>[];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    return availableBiometrics;
  }

  Future<bool> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
            'Authenticate to access the app', // Message shown to the user
        options: const AuthenticationOptions(
          stickyAuth: true, // iOS-only: Keeps the authentication dialog visible
          biometricOnly: true, // If true, only allows biometric authentication
        ),
      );
      if (authenticated) {
        // Authentication successful, navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Authentication failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Authentication failed. Please try again.')),
        );
      }
    } on PlatformException catch (e) {
      print('Error during authentication: $e');
      // Handle specific errors like notEnrolled, lockedOut, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication error: ${e.message}')),
      );
    }
    return authenticated;
  }

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
              IconButton(
                icon: Icon(
                  Icons.fingerprint,
                  size: 80,
                ),
                color: Colors.white,
                onPressed: _authenticatePressed,
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
