import 'package:presensi_online_mobile/data/datasource/remote/dio/dio_client.dart';
import 'package:presensi_online_mobile/data/datasource/remote/exception/api_error_handler.dart';
import 'package:presensi_online_mobile/data/model/base/api_response.dart';
import 'package:presensi_online_mobile/data/model/user_model.dart';
import 'package:presensi_online_mobile/data/model/base/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

import 'package:presensi_online_mobile/utility/app_constants.dart';

class JadwalKelasRepo {
  final DioClient dioClient;
  JadwalKelasRepo({@required this.dioClient});

  Future<Map<String, dynamic>> getJadwalKelas({
    nrp: String,
  }) async {
    var dio = Dio();
    final response = await dio.post(AppConstants.BASE_URL + nrp + '/kelas');
    var map = Map<String, dynamic>.from(response.data);
    return map;
  }
}
