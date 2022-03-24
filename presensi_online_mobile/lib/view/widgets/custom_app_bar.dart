import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      color: ColorResources.COLOR_PRIMARY,
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: ColorResources.COLOR_WHITE,
                size: 22,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(right: 50, left: 10, top: 8),
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: khulaSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                    color: ColorResources.COLOR_WHITE)),
          )),
        ],
      ),
    );
  }
}
