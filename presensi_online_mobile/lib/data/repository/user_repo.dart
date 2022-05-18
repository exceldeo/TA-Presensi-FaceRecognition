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

class UserRepo {
  final DioClient dioClient;
  UserRepo({@required this.dioClient});

  // Future<ApiResponse<List<DokterModel>>> getDokterList() async {
  //   var dio = Dio();
  //   try {
  //     final response =
  //         await dio.get(AppConstants.BASE_URL + 'Dokter/listDokter');
  //     final List objects = response.data;
  //     final list = objects.map((o) => DokterModel.fromJson(o)).toList();
  //     return ApiResponse.withSuccess(list);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }

  Future<Map<String, dynamic>> authLogin(
      {nrp: String, password: String}) async {
    var dio = Dio();
    // try {
    //   final response = await dio.post(AppConstants.BASE_URL + 'login',
    //       data: {"nrp": "${nrp}", "password": "${password}"});
    //   final objects = UserModel.fromJson(map['data']);
    //   return ApiResponse.withSuccess(objects);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }
    final response = await dio.post(AppConstants.BASE_URL + 'login',
        data: {"nrp": "${nrp}", "password": "${password}"});
    var map = Map<String, dynamic>.from(response.data);
    return map;
  }
}
