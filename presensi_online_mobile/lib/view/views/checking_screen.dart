import 'package:presensi_online_mobile/models/jadwal.dart';
import 'package:presensi_online_mobile/models/jadwalDetail.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/views/qr_scanner_screen.dart';
import 'package:presensi_online_mobile/view/views/take_picture_screen.dart';
import 'package:presensi_online_mobile/view/widgets/card_class_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CheckingScreen extends StatefulWidget {
  final JadwalDetail jadwalKelas;

  CheckingScreen({this.jadwalKelas});
  @override
  _CheckingScreenState createState() => _CheckingScreenState();
}

class _CheckingScreenState extends State<CheckingScreen> {
  Widget _homeToolbar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorResources.COLOR_PRIMARY,
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(2),
            child: Text(
              widget.jadwalKelas.kodeMatakuliah,
              style: khulaRegular.copyWith(
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: ColorResources.COLOR_WHITE,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.jadwalKelas.namaMatakuliah,
            style: khulaSemiBold.copyWith(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: ColorResources.COLOR_BLACK,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icon/calendar-outlined.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.jadwalKelas.hari,
                        style:
                            TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icon/clock.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.jadwalKelas.jamMulai,
                        style:
                            TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icon/building2.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.jadwalKelas.namaKelas,
                        style:
                            TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Dosen",
            style: khulaSemiBold.copyWith(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: ColorResources.COLOR_BLACK,
            ),
          ),
          Text(
            widget.jadwalKelas.namaDosen,
            style: khulaRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: ColorResources.COLOR_BLACK,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      appBar: AppBar(
        title: Text(Strings.CHECKIN_INFORMASI),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _homeToolbar(context),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: TakePictureScreen(
                            idPresensiMahasiswa:
                                widget.jadwalKelas.idPresensiMahasiswa,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Icon/scan-outlined.png',
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Scan Wajah Untuk Absen",
                              style: TextStyle(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                        ],
                      ),
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                          backgroundColor: MaterialStateProperty.all(
                              ColorResources.COLOR_PRIMARY),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
