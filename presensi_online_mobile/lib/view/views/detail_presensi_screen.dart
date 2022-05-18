// import 'package:presensi_online_mobile/helper/utils.dart';
import 'package:presensi_online_mobile/models/jadwal.dart';
import 'package:presensi_online_mobile/providers/presensi_provider.dart';
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
import 'package:provider/provider.dart';

class DetailPresensiScreen extends StatefulWidget {
  final Jadwal jadwalKelas;

  DetailPresensiScreen({this.jadwalKelas});

  @override
  _DetailPresensiScreenState createState() => _DetailPresensiScreenState();
}

class _DetailPresensiScreenState extends State<DetailPresensiScreen> {
  @override
  Widget build(BuildContext context) {
    PresensiProvider _presensiProvider = Provider.of<PresensiProvider>(context);

    _listPresensi() => Container(
          color: ColorResources.COLOR_WHITE,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _presensiProvider.presensiList.length,
            itemBuilder: (context, index) {
              return PresensiCardWidget(
                  _presensiProvider.presensiList[index], index);
            },
          ),
        );

    return Provider(
        lazy: false,
        create: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _presensiProvider.fetchPresensi(
                idJadwalMahasiswa: widget.jadwalKelas.idJadwalMahasiswa);
          });
        },
        dispose: (context, data) => _presensiProvider.resetPresensi(),
        child: Scaffold(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                                      'assets/Icon/date-line.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(widget.jadwalKelas.hari,
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
                                    Text(widget.jadwalKelas.jamMulai,
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
                                    Text(widget.jadwalKelas.namaKelas,
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
                            widget.jadwalKelas.namaDosen,
                            style: khulaRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: ColorResources.COLOR_BLACK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _listPresensi(),
                    // Container(
                    //   child: ListView(
                    //     primary: false,
                    //     shrinkWrap: true,
                    //     children: [
                    //       PresensiCardWidget("data"),
                    //       PresensiCardWidget("data"),
                    //       PresensiCardWidget("data"),
                    //       PresensiCardWidget("data"),
                    //     ],
                    //   ),
                    // ),
                    // _cardDetailKelas(context),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
