import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/strings.dart';

class QRcodeScannerScreen extends StatefulWidget {
  QRcodeScannerScreen({Key key}) : super(key: key);

  @override
  State<QRcodeScannerScreen> createState() => _QRcodeScannerScreenState();
}

class _QRcodeScannerScreenState extends State<QRcodeScannerScreen> {
  @override
  Widget build(BuildContext context) {
    String result = '';
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      appBar: AppBar(
        title: Text(Strings.PINDAI_KODE_PRESENSI),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(result),
              MaterialButton(
                  color: ColorResources.COLOR_WHITE,
                  padding: EdgeInsets.all(8),
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Image.asset(
                    'assets/Icon/camera-blue.png',
                    height: 40,
                    width: 40,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
