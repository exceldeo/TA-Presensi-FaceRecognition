import 'package:presensi_online_mobile/data/model/jadwal_kelas_model.dart';
import 'package:presensi_online_mobile/data/model/user_model.dart';
import 'package:presensi_online_mobile/provider/jadwal_kelas_provider.dart';
import 'package:presensi_online_mobile/provider/user_provider.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/views/checking_screen.dart';
import 'package:presensi_online_mobile/view/views/qr_scanner_screen.dart';
import 'package:presensi_online_mobile/view/widgets/card_class_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel _user;
  UserProvider _userProvider;
  JadwalKelasProvider _jadwalKelasProvider;
  List<JadwalKelasModel> _listJadwalKelas;
  var indicator = new GlobalKey<RefreshIndicatorState>();
  bool _loading = true;

  Future fetchDataJadwalKelas({nrp: String}) async {
    _jadwalKelasProvider =
        Provider.of<JadwalKelasProvider>(context, listen: false);
    _listJadwalKelas =
        await _jadwalKelasProvider.fetchDataListJadwalKelas(nrp: nrp);
  }

  @override
  Future<void> initState() {
    super.initState();

    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _user = _userProvider.getUser();
    fetchDataJadwalKelas(nrp: _user.nrp);
    _jadwalKelasProvider =
        Provider.of<JadwalKelasProvider>(context, listen: false);
    _listJadwalKelas = _jadwalKelasProvider.getListJadwalKelas();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_userProvider.loadingStateGetUser &&
          _jadwalKelasProvider.loadingStateGetJadwalKelas) {
        indicator.currentState?.show();
      } else {
        indicator.currentState?.deactivate();
      }
    });
  }

  Widget _homeToolbar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Pagi,",
                  style: khulaRegular.copyWith(
                      color: ColorResources.COLOR_BLACK,
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ///nama
                  _user?.namaMahasiswa,
                  style: khulaRegular.copyWith(
                      color: ColorResources.COLOR_BLACK,
                      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      fontWeight: FontWeight.bold),
                ),
                // Text(
                //   "Harap traning wajah terlebih dahulu",
                //   style: khulaRegular.copyWith(
                //       color: ColorResources.COLOR_PRIMARY,
                //       fontSize: Dimensions.FONT_SIZE_SMALL,
                //       fontWeight: FontWeight.w100),
                // ),
              ],
            ),
          ),
          // Container(
          //   width: 37,
          //   height: 35,
          //   margin: EdgeInsets.only(right: 10),
          //   child: CircleAvatar(
          //     backgroundColor: ColorResources.COLOR_GAINSBORO,
          //     child: Icon(
          //       Icons.person,
          //       color: ColorResources.COLOR_WHITE,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
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
                          screen: CheckingScreen(),
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
                          Text("Scan QR Code untuk Absen",
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_PRIMARY,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          topLeft: Radius.circular(16.0))),
                  child: Text("Daftar Kuliah",
                      style: TextStyle(
                          color: ColorResources.COLOR_WHITE,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          fontWeight: FontWeight.bold)),
                ),
                _list()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _list() => Container(
  //       color: ColorResources.COLOR_WHITE,
  //       child: ListView(
  //         primary: false,
  //         shrinkWrap: true,
  //         children: [
  //           ClassCardWidget("data"),
  //           ClassCardWidget("data2"),
  //           ClassCardWidget("data"),
  //           ClassCardWidget("data2"),
  //           ClassCardWidget("data"),
  //           ClassCardWidget("data2")
  //         ],
  //       ),
  //     );

  _list() => Container(
        color: ColorResources.COLOR_WHITE,
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children:
              _listJadwalKelas.map((e) => ClassCardWidget("data2")).toList(),
        ),
      );
}
