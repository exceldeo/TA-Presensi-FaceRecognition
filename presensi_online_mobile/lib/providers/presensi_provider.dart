import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:presensi_online_mobile/models/jadwal.dart';
import 'package:presensi_online_mobile/models/jadwalDetail.dart';
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

  Future<Map<String, dynamic>> checkPresensi({kodePresensi: String}) async {
    var result;

    final user = await UserPreferences().getUser();
    final userNrp = user.nrp;

    Response response = await get(
      AppConstants.BASE_URL + "${userNrp}/${kodePresensi}/absensi",
    );

    if (response.statusCode == 200) {
      var responseData = Map<String, dynamic>.from(json.decode(response.body));
      var jadwal = JadwalDetail.fromJson(responseData["data"]);

      result = {
        'status': true,
        'message': 'Successful',
        'data': jadwal,
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      notifyListeners();

      result = {
        'status': false,
        'message': responseData['message'],
      };
    }

    // print(result);
    return result;
  }

  Future<Map<String, dynamic>> ubahPresensi(
      {idPresensiMahasiswa: String, img: String}) async {
    var result;
    print(img);
    Response response = await post(
      AppConstants.BASE_URL + "${idPresensiMahasiswa}/updateAbsensi",
      body: {'img': img},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData['data']);

    if (response.statusCode == 200) {
      result = {
        'status': true,
        'message': 'Successful',
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      notifyListeners();

      result = {
        'status': false,
        'message': responseData['message'],
      };
    }

    // print(result);
    return result;
  }
}
