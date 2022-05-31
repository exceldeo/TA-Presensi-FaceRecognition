import 'package:presensi_online_mobile/models/jadwal.dart';
import 'package:presensi_online_mobile/models/jadwalDetail.dart';
import 'package:presensi_online_mobile/providers/presensi_provider.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:presensi_online_mobile/view/views/checking_screen.dart';
import 'package:presensi_online_mobile/view/views/qr_scanner_screen.dart';
import 'package:presensi_online_mobile/view/views/take_picture_screen.dart';
import 'package:presensi_online_mobile/view/widgets/button/custom_button.dart';
import 'package:presensi_online_mobile/view/widgets/card_class_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:presensi_online_mobile/view/widgets/edittext/custom_text_field.dart';
import 'package:presensi_online_mobile/view/widgets/textfield_title_widget.dart';
import 'package:provider/provider.dart';

class InputPresensiCodeScreen extends StatefulWidget {
  @override
  _InputPresensiCodeScreenState createState() =>
      _InputPresensiCodeScreenState();
}

class _InputPresensiCodeScreenState extends State<InputPresensiCodeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _presensiCodeController =
        TextEditingController(text: '');
    FocusNode _presensiCodeNode = FocusNode();
    PresensiProvider _presensiProvider = Provider.of<PresensiProvider>(context);

    String alert = "";

    var kirim = () {
      if (_presensiCodeController.text.isEmpty) {
        setState(() {
          alert = "Kode presensi tidak boleh kosong";
        });
      } else {
        final Future<Map<String, dynamic>> successfulMessage = _presensiProvider
            .checkPresensi(kodePresensi: _presensiCodeController.text);
        successfulMessage.then((response) {
          if (response['status']) {
            JadwalDetail jadwal = response['data'];
            pushNewScreen(
              context,
              screen: CheckingScreen(
                jadwalKelas: jadwal,
              ),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else {
            final snackBar = SnackBar(
              content: Text(
                  'Kode Presensi Salah atau anda sudah melakukan presensi'),
              backgroundColor: ColorResources.COLOR_BLACK,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
        // pushNewScreen(
        //   context,
        //   screen: CheckingScreen(),
        //   withNavBar: false,
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      }
    };

    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      appBar: AppBar(
        title: Text(Strings.HALAMAN_KODE_PRESENSI),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: ColorResources.COLOR_BACKGROUND,
            child: Column(
              children: [
                Container(
                  child: Text(
                    alert,
                    style: khulaRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      color: ColorResources.COLOR_RED,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.MARGIN_SIZE_DEFAULT,
                      right: Dimensions.MARGIN_SIZE_DEFAULT,
                      bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          alert,
                          style: khulaRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.COLOR_RED,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                        child:
                            // CustomTextField(
                            //   textInputType: TextInputType.number,
                            //   textInputAction: TextInputAction.next,
                            //   focusNode: _presensiCodeNode,
                            //   controller: _presensiCodeController,
                            // ),

                            TextField(
                          keyboardType: TextInputType.number,
                          controller: _presensiCodeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kode Presensi',
                            hintText: 'Masukan Kode Presensi',
                          ),
                        ),

                        //     TextField(
                        //   // obscureText: true,
                        //   onChanged: (value) {
                        //     print(value);
                        //   },
                        //   controller: _presensiCodeController,
                        //   style: TextStyle(
                        //     fontSize: 16.0,
                        //     fontFamily: 'Roboto',
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.normal,
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
                // for signin button
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                  ),
                  child: CustomButton(
                    btnTxt: Strings.KIRIM,
                    onTap: kirim,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
