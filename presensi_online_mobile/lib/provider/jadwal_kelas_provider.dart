import 'package:presensi_online_mobile/data/model/jadwal_kelas_model.dart';
import 'package:presensi_online_mobile/data/model/user_model.dart';
import 'package:presensi_online_mobile/data/repository/jadwal_kelas_repo.dart';
import 'package:presensi_online_mobile/data/repository/user_repo.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_online_mobile/utility/app_constants.dart';

class JadwalKelasProvider extends ChangeNotifier {
  final JadwalKelasRepo jadwalKelasRepo;
  JadwalKelasProvider({@required this.jadwalKelasRepo});

  List<JadwalKelasModel> listJadwalKelas = [];
  bool loadingStateGetJadwalKelas = true;

  Future<List<JadwalKelasModel>> fetchDataListJadwalKelas({nrp: String}) async {
    // final response = await http.get(AppConstants.BASE_URL + nrp + '/kelas');
    Map<String, dynamic> value = await jadwalKelasRepo.getJadwalKelas(nrp: nrp);
    if (value["status"] == "success") {
      List decoded = json.decode(value["data"]);

      this.listJadwalKelas =
          decoded.map((value) => JadwalKelasModel.fromJson(value)).toList();
      return this.listJadwalKelas;
    }
  }

  List<JadwalKelasModel> getListJadwalKelas() {
    if (listJadwalKelas != null) {
      loadingStateGetJadwalKelas = false;
      return listJadwalKelas;
    }
  }
}
