import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:presensi_online_mobile/models/jadwal.dart';
import 'package:presensi_online_mobile/models/user.dart';
import 'dart:async';
import 'dart:convert';

import 'package:presensi_online_mobile/utility/app_constants.dart';
import 'package:presensi_online_mobile/utility/user_preference.dart';

class JadwalProvider with ChangeNotifier {
  List<Jadwal> _jadwalList = [];
  List<Jadwal> get jadwalList => _jadwalList;

  Future<Map<String, dynamic>> fetchJadwal() async {
    var result;
    _jadwalList = [];
    final user = await UserPreferences().getUser();
    final userNrp = user.nrp;

    Response response = await get(
      AppConstants.BASE_URL + "${userNrp}/kelas",
    );

    if (response.statusCode == 200) {
      var responseData = Map<String, dynamic>.from(json.decode(response.body));
      List<dynamic> jadwalDataList = responseData['data'];

      for (final jadwalData in jadwalDataList) {
        Jadwal jadwal = Jadwal.fromJson(jadwalData);
        _jadwalList.add(jadwal);
      }

      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'data': _jadwalList,
      };
    } else {
      notifyListeners();

      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    // print(result);
    return result;
  }
}
