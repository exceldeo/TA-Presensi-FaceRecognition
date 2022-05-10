import 'package:presensi_online_mobile/view/views/auth/doctor_signup_screen.dart';
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

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nrpController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    FocusNode _nrpNode = FocusNode();
    FocusNode _passNode = FocusNode();

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
                  height: 50.0,
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
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => StartupScreen()));
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
