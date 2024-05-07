// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezo_app/main.dart';
import 'package:shoezo_app/screens/login_page.dart';
import 'package:shoezo_app/widgets/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  Future<void> checkLogin() async {
    final sharedprefer = await SharedPreferences.getInstance();
    final userLogin = sharedprefer.getBool(save_key);
    if (userLogin == null || userLogin == false) {
      checkloginFail();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNav()));
    }
  }

  Future<void> checkloginFail() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SHOEZO',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
