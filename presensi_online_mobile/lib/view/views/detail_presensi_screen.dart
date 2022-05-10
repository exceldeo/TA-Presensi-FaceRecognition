import 'package:presensi_online_mobile/helper/utils.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/widgets/button/custom_button.dart';
import 'package:presensi_online_mobile/view/widgets/card_class_widget.dart';
import 'package:presensi_online_mobile/view/widgets/card_presensi_widget.dart';
import 'package:presensi_online_mobile/view/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPresensiScreen extends StatefulWidget {
  @override
  _DetailPresensiScreenState createState() => _DetailPresensiScreenState();
}

class _DetailPresensiScreenState extends State<DetailPresensiScreen> {
  Widget _cardDetailKelas(BuildContext context) {
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
              "Code Matkul",
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
            "Nama Kelas",
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
                    Text("matkul",
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
                    Text("matkul",
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
                    Text("matkul",
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
            "Dosen",
            style: khulaRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: ColorResources.COLOR_BLACK,
            ),
          ),
          Text(
            "Dosen",
            style: khulaRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: ColorResources.COLOR_BLACK,
            ),
          ),
        ],
      ),
    );
  }

  _list() => Container(
        color: ColorResources.COLOR_PRIMARY,
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            // PresensiCardWidget("data"),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      appBar: AppBar(
        title: Text(Strings.DETAIL_PRESENSI),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
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
                          "Code Matkul",
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
                        "Nama Kelas",
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
                                  'assets/Icon/date-line.png',
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("matkul",
                                    style: TextStyle(
                                        fontSize:
                                            Dimensions.FONT_SIZE_DEFAULT)),
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
                                Text("matkul",
                                    style: TextStyle(
                                        fontSize:
                                            Dimensions.FONT_SIZE_DEFAULT)),
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
                                Text("matkul",
                                    style: TextStyle(
                                        fontSize:
                                            Dimensions.FONT_SIZE_DEFAULT)),
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
                        "Dosen",
                        style: khulaRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: ColorResources.COLOR_BLACK,
                        ),
                      ),
                      Text(
                        "Dosen",
                        style: khulaRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: ColorResources.COLOR_BLACK,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      PresensiCardWidget("data"),
                      PresensiCardWidget("data"),
                      PresensiCardWidget("data"),
                      PresensiCardWidget("data"),
                    ],
                  ),
                ),
                // _cardDetailKelas(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
