import 'package:presensi_online_mobile/data/model/specialist.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:presensi_online_mobile/view/views/detail_presensi_screen.dart';

class PresensiCardWidget extends StatelessWidget {
  final String matkul;

  PresensiCardWidget(this.matkul);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: DetailPresensiScreen(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
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
              child: Text("Perkuliahan ke - 1",
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
                      Text("Senin, 12 Januari 2020",
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
                      Text("08.00 - 10.00",
                          style:
                              TextStyle(fontSize: Dimensions.FONT_SIZE_SMALL)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Dosen",
                    style: khulaSemiBold.copyWith(
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      color: ColorResources.COLOR_BLACK,
                    ),
                  ),
                  Text(
                    "Dosen 1",
                    style: khulaRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: ColorResources.COLOR_BLACK,
                    ),
                  ),
                  Text(
                    "Dosen 2",
                    style: khulaRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: ColorResources.COLOR_BLACK,
                    ),
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
                  Text("Hadir",
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
                      Text("12 Januari 2020",
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
                      Text("08.10",
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
