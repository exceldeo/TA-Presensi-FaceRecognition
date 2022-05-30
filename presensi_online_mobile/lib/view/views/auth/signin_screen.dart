// import 'package:presensi_online_mobile/provider/jadwal_kelas_provider.dart';
// import 'package:presensi_online_mobile/provider/user_provider.dart';
// import 'package:presensi_online_mobile/services/auth_services.dart';
import 'package:presensi_online_mobile/models/user.dart';
import 'package:presensi_online_mobile/providers/user_provider.dart';
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
    UserProvider userProvider = Provider.of<UserProvider>(context);
    TextEditingController _nrpController = TextEditingController(text: '');
    TextEditingController _passwordController = TextEditingController(text: '');
    FocusNode _nrpNode = FocusNode();
    FocusNode _passNode = FocusNode();
    String alert = "";

    var login = () {
      // Navigator.pushNamed(context, RouteConstants.landingPage);

      final Future<Map<String, dynamic>> successfulMessage = userProvider.login(
          nrp: _nrpController.value.text.trim(),
          password: _passwordController.value.text.trim());

      successfulMessage.then((response) {
        if (response['status']) {
          User user = response['user'];
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => StartupScreen()));
        } else {
          final snackBar = SnackBar(
            content: Text('NRP atau Password salah'),
            backgroundColor: ColorResources.COLOR_BLACK,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    };

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
                    onTap: login,
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
