import 'dart:async';

import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/views/auth/signin_screen.dart';
import 'package:presensi_online_mobile/view/views/onBorad/doctor_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:presensi_online_mobile/view/views/startup_screen.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (c) => StartupScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMARY,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.4,
              margin: EdgeInsets.only(bottom: 10),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(Icons.check,
                  size: MediaQuery.of(context).size.width * 0.3,
                  color: ColorResources.COLOR_PRIMARY)),
          Text(
            "Anda Berhasil Absen",
            style: khulaRegular.copyWith(
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                color: ColorResources.COLOR_WHITE,
                fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
