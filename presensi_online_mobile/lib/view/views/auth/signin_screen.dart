import 'package:presensi_online_mobile/provider/jadwal_kelas_provider.dart';
import 'package:presensi_online_mobile/provider/user_provider.dart';
import 'package:presensi_online_mobile/services/auth_services.dart';
import 'package:presensi_online_mobile/view/views/auth/widget/social_media_widget.dart';
import 'package:presensi_online_mobile/view/views/startup_screen.dart';
import 'package:presensi_online_mobile/view/widgets/button/custom_button.dart';
import 'package:presensi_online_mobile/view/widgets/edittext/custom_pass_field.dart';
import 'package:presensi_online_mobile/view/widgets/edittext/custom_text_field.dart';
import 'package:presensi_online_mobile/view/widgets/textfield_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/strings.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    TextEditingController _nrpController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    FocusNode _nrpNode = FocusNode();
    FocusNode _passNode = FocusNode();
    String alert = "";

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: ColorResources.COLOR_BACKGROUND,
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Image.asset(
                  'assets/logo-blue.png',
                  height: 200,
                  width: 230,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    alert,
                    style: khulaRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_SMALL,
                      color: ColorResources.COLOR_RED,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.MARGIN_SIZE_DEFAULT,
                      right: Dimensions.MARGIN_SIZE_DEFAULT,
                      bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                  child: Stack(
                    children: [
                      TextFieldTitleWidget(
                        imageUrl: 'assets/Icon/user.png',
                        title: Strings.MYITS_ID,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                        child: CustomTextField(
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: _nrpNode,
                          nextNode: _passNode,
                          controller: _nrpController,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.MARGIN_SIZE_DEFAULT,
                      right: Dimensions.MARGIN_SIZE_DEFAULT,
                      bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                  child: Stack(
                    children: [
                      TextFieldTitleWidget(
                        imageUrl: 'assets/Icon/security.png',
                        title: Strings.PASSWORD,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                        child: CustomPassField(
                          textInputAction: TextInputAction.done,
                          focusNode: _passNode,
                          controller: _passwordController,
                        ),
                      ),
                    ],
                  ),
                ),

                // for signin button
                SizedBox(
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                  ),
                  child: CustomButton(
                    btnTxt: Strings.SIGN_IN,
                    onTap: () async {
                      bool returnValue = await provider.authLogin(
                          nrp: _nrpController.value.text.trim(),
                          password: _passwordController.value.text.trim());
                      if (returnValue == true) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                StartupScreen()));
                      } else {
                        setState(() {
                          alert = "Password atau NRP salah";
                        });
                      }
                    },
                  ),
                ),

                // FlatButton(
                //   onPressed: () {
                //     //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
                //   },
                //   child: Text(
                //     Strings.FORGET_PASSWORD,
                //     style: khulaRegular.copyWith(
                //       fontSize: Dimensions.FONT_SIZE_SMALL,
                //       color: ColorResources.COLOR_GREY,
                //     ),
                //   ),
                // ),

                // Container(
                //   margin: EdgeInsets.all(Dimensions.MARGIN_SIZE_DEFAULT),
                //   child: Row(
                //     children: [
                //       Text(
                //         Strings.OR_SIGN_IN,
                //         style: khulaRegular.copyWith(
                //           color: ColorResources.COLOR_GREY,
                //           fontSize: Dimensions.FONT_SIZE_SMALL,
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           height: 1,
                //           width: 10,
                //           color: ColorResources.COLOR_GAINSBORO,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // for or sign in

                // SizedBox(
                //   height: 50,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => DoctorSignUpScreen()));
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         Strings.HAVENT_ANY,
                //         style: khulaSemiBold.copyWith(
                //             color: ColorResources.COLOR_GREY,
                //             fontSize: Dimensions.FONT_SIZE_SMALL),
                //       ),
                //       Text(
                //         Strings.CREATE_AN_ACCOUNT,
                //         style: khulaSemiBold.copyWith(
                //             color: ColorResources.COLOR_PRIMARY,
                //             fontSize: Dimensions.FONT_SIZE_SMALL),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
