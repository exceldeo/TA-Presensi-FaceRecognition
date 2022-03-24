import 'dart:async';

import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/view/views/auth/signin_screen.dart';
import 'package:presensi_online_mobile/view/views/onBorad/doctor_onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMARY,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 300,
          width: 350,
        ),
      ),
    );
  }
}
