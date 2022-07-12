import 'dart:io';
import 'dart:convert';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:presensi_online_mobile/providers/presensi_provider.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/loader.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/views/startup_screen.dart';
import 'package:presensi_online_mobile/view/views/success_screen.dart';
import 'package:presensi_online_mobile/view/widgets/button/custom_button.dart';
import 'package:presensi_online_mobile/view/widgets/custom_app_bar.dart';
import 'package:presensi_online_mobile/view/widgets/edittext/custom_text_field.dart';
import 'package:presensi_online_mobile/view/widgets/textfield_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TakePictureScreen extends StatefulWidget {
  final int idPresensiMahasiswa;

  TakePictureScreen({this.idPresensiMahasiswa});

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  String path = '';
  String encoded;
  File imageSelected;

  bool instruksi = true;
  String alert = '';
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    PresensiProvider presensiProvider = Provider.of<PresensiProvider>(context);

    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      appBar: AppBar(
        title: Text(Strings.SCAN_WAJAH),
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (instruksi)
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_PRIMARY,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Text(
                      'Pastikan Anda Menggunakan Masker',
                      style: TextStyle(color: ColorResources.COLOR_WHITE),
                    ),
                  ),
                if (alert.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_RED,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Text(
                      alert,
                      style: TextStyle(
                          color: ColorResources.COLOR_WHITE, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                imageSelected != null
                    ? Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.height * 0.5,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorResources.COLOR_PRIMARY, width: 5),
                        ),
                        child: Image.file(imageSelected, fit: BoxFit.cover))
                    : Container(
                        padding: EdgeInsets.all(3),
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.height * 0.5,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorResources.COLOR_PRIMARY, width: 5),
                        ),
                      ),
                MaterialButton(
                    color: ColorResources.COLOR_WHITE,
                    padding: EdgeInsets.all(8),
                    onPressed: () async {
                      setState(() {
                        this.alert = '';
                        instruksi = true;
                      });
                      final picker = ImagePicker();
                      PickedFile value = await picker.getImage(
                          source: ImageSource.camera, imageQuality: 30);
                      if (value != null) {
                        setState(() {
                          this.imageSelected = File(value.path);
                          this.path = value.path;
                          this.encoded =
                              base64Encode(File(value.path).readAsBytesSync());
                          _load = true;
                        });
                      }
                      ;

                      final Future<Map<String, dynamic>> successfulMessage =
                          presensiProvider.ubahPresensi(
                              idPresensiMahasiswa:
                                  widget.idPresensiMahasiswa.toString(),
                              img: this.encoded);

                      successfulMessage.then((response) {
                        if (response['status']) {
                          setState(() {
                            _load = false;
                          });
                          pushNewScreen(
                            context,
                            screen: SuccessScreen(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        } else {
                          setState(() {
                            _load = false;
                          });
                          setState(() {
                            this.alert =
                                'Pastikan Anda Menggunakan Masker, Silahkan Coba Lagi';
                            instruksi = false;
                          });
                          final snackBar = SnackBar(
                            content: Text('Anda Tidak Memakai Masker'),
                            backgroundColor: ColorResources.COLOR_BLACK,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                    shape: CircleBorder(),
                    child: Image.asset(
                      'assets/Icon/camera-blue.png',
                      height: 40,
                      width: 40,
                    )),
                Container(
                    child:
                        _load ? Loader(loadingTxt: 'Loading...') : Container())
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
