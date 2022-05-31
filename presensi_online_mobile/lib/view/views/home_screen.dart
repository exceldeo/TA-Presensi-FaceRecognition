// import 'package:presensi_online_mobile/data/model/jadwal_kelas_model.dart';
// import 'package:presensi_online_mobile/data/model/user_model.dart';
// import 'package:presensi_online_mobile/provider/jadwal_kelas_provider.dart';
// import 'package:presensi_online_mobile/provider/user_provider.dart';
import 'package:presensi_online_mobile/models/userPreference.dart';
import 'package:presensi_online_mobile/providers/jadwal_provider.dart';
import 'package:presensi_online_mobile/providers/user_provider.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/utility/user_preference.dart';
import 'package:presensi_online_mobile/view/views/checking_screen.dart';
import 'package:presensi_online_mobile/view/views/input_presensi_code_screen.dart';
import 'package:presensi_online_mobile/view/views/qr_scanner_screen.dart';
import 'package:presensi_online_mobile/view/widgets/card_class_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreferenceModel _userPreference;
  String _namaMahasiswa = '';
  String salam = '';
  var now = new DateTime.now();

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
                  now.hour < 12 ? 'Selamat Pagi,' : 'Selamat Siang,',
                  style: khulaRegular.copyWith(
                      color: ColorResources.COLOR_BLACK,
                      fontSize: Dimensions.FONT_SIZE_DEFAULT),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _namaMahasiswa,
                  style: khulaRegular.copyWith(
                      color: ColorResources.COLOR_BLACK,
                      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _namaMahasiswa = 'Loading...';
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.getNamaUser().then((value) => setState(() {
          _namaMahasiswa = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    JadwalProvider _jadwalKelasProvider = Provider.of<JadwalProvider>(context);

    _list() => Container(
          color: ColorResources.COLOR_WHITE,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _jadwalKelasProvider.jadwalList.length,
            itemBuilder: (context, index) {
              return ClassCardWidget(_jadwalKelasProvider.jadwalList[index]);
            },
          ),
        );

    return Provider(
      lazy: false,
      create: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _jadwalKelasProvider.fetchJadwal();
        });
      },
      dispose: (context, data) {},
      child: SafeArea(
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
                          screen: InputPresensiCodeScreen(),
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
                          Text("Catat Kehadiran",
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

}
