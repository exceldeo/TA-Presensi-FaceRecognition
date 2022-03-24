import 'dart:io';

import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/views/auth/signin_screen.dart';
import 'package:presensi_online_mobile/view/views/startup_screen.dart';
import 'package:presensi_online_mobile/view/widgets/button/custom_button.dart';
import 'package:presensi_online_mobile/view/widgets/custom_app_bar.dart';
import 'package:presensi_online_mobile/view/widgets/edittext/custom_text_field.dart';
import 'package:presensi_online_mobile/view/widgets/textfield_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  final fromSetting;

  ProfileScreen({this.fromSetting});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isMale = true;
  TextEditingController _locationController = TextEditingController();
  DateTime _date;
  File file;
  FocusNode _locationNode = FocusNode();

  void _choose() async {
    final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_GAINSBORO,
                              borderRadius: BorderRadius.circular(24)),
                          child: Icon(Icons.person,
                              color: ColorResources.COLOR_WHITE, size: 75)),
                    ),
                    SizedBox(height: 50),
                    Text(Strings.NAMA,
                        style: khulaRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: ColorResources.COLOR_GREY,
                        )),
                    Text(Strings.NAMA1,
                        style: khulaSemiBold.copyWith(
                          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                          color: ColorResources.COLOR_BLACK,
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: CustomButton(
                  btnTxt: Strings.LOGOUT,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => SignInScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
