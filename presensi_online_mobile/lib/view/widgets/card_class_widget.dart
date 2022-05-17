import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:presensi_online_mobile/view/views/detail_presensi_screen.dart';

class ClassCardWidget extends StatelessWidget {
  final String matkul;

  ClassCardWidget(this.matkul);

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
        decoration: BoxDecoration(
            color: ColorResources.COLOR_WHITE,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //perlu di ganti
                  Text(matkul,
                      style: TextStyle(
                          color: ColorResources.COLOR_BLACK,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(matkul,
                      style: TextStyle(
                          color: ColorResources.COLOR_PRIMARY,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
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
                            Text(matkul,
                                style: TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT)),
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
                            Text(matkul,
                                style: TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT)),
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
                            Text(matkul,
                                style: TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 36,
            )
          ],
        ),
      ),
    );
  }
}
