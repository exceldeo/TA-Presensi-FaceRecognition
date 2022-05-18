import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:presensi_online_mobile/models/jadwal.dart';
import 'package:presensi_online_mobile/models/presensi.dart';
import 'package:presensi_online_mobile/models/user.dart';
import 'dart:async';
import 'dart:convert';

import 'package:presensi_online_mobile/utility/app_constants.dart';
import 'package:presensi_online_mobile/utility/user_preference.dart';

class PresensiProvider with ChangeNotifier {
  List<Presensi> _presensiList = [];
  List<Presensi> get presensiList => _presensiList;

  Future<Map<String, dynamic>> fetchPresensi(
      {idJadwalMahasiswa: String}) async {
    var result;
    _presensiList = [];
    Response response = await get(
      AppConstants.BASE_URL + "${idJadwalMahasiswa}/presensi",
    );

    // print("id jadwal mahasiswa: ${idJadwalMahasiswa}");

    if (response.statusCode == 200) {
      var responseData = Map<String, dynamic>.from(json.decode(response.body));
      List<dynamic> presensiDataList = responseData['data'];

      for (final presensiData in presensiDataList) {
        Presensi presensi = Presensi.fromJson(presensiData);
        _presensiList.add(presensi);
      }

      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'data': _presensiList,
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

  void resetPresensi() {
    List<Presensi> _presensiList = [];
  }
}
