import 'package:presensi_online_mobile/models/presensi.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:presensi_online_mobile/view/views/detail_presensi_screen.dart';

class PresensiCardWidget extends StatelessWidget {
  final Presensi presensi;
  final int index;

  PresensiCardWidget(this.presensi, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        color: ColorResources.COLOR_WHITE,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMARY,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(16.0))),
              child: Text("Perkuliahan ke - ${index + 1}",
                  style: TextStyle(
                      color: ColorResources.COLOR_WHITE,
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              color: ColorResources.COLOR_WHITE,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //perlu di ganti
                  Text("Jadwal",
                      style: TextStyle(
                          color: ColorResources.COLOR_BLACK,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/Icon/calendar-outlined.png',
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${presensi.tanggalPresensi}",
                          style:
                              TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL)),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/Icon/clock.png',
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${presensi.jamMulai} - ${presensi.jamAkhir}",
                          style:
                              TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Kehadiran",
                    style: khulaSemiBold.copyWith(
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: ColorResources.COLOR_BLACK,
                    ),
                  ),
                  presensi.status == 0
                      ? Text("Tidak Hadir",
                          style: TextStyle(
                              color: ColorResources.COLOR_RED,
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                              fontWeight: FontWeight.bold))
                      : Text("Hadir",
                          style: TextStyle(
                              color: ColorResources.COLOR_GREEN,
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                              fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text("Tanggal:",
                          style: TextStyle(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: ColorResources.COLOR_GREY)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${presensi.tanggalAbsen}",
                          style: TextStyle(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Waktu:",
                          style: TextStyle(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: ColorResources.COLOR_GREY)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${presensi.jam}",
                          style: TextStyle(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
