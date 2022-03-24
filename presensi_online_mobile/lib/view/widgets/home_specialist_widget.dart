import 'package:presensi_online_mobile/data/model/specialist.dart';
import 'package:presensi_online_mobile/utility/colorResources.dart';
import 'package:presensi_online_mobile/utility/dimensions.dart';
import 'package:presensi_online_mobile/utility/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSpecialistWidget extends StatelessWidget {
  final SpeciaList speciaList;

  HomeSpecialistWidget(this.speciaList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      margin: EdgeInsets.only(right: 12, bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: speciaList.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: .4,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              speciaList.iconUrl,
              width: 42,
              height: 32,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: 5,
            ),
            Text(speciaList.title,
                textAlign: TextAlign.center,
                style: khulaSemiBold.copyWith(
                    color: ColorResources.COLOR_WHITE,
                    fontSize: Dimensions.FONT_SIZE_SMALL))
          ],
        ),
      ),
    );
  }
}
