import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_online_mobile/data/model/user_model.dart';
import 'package:presensi_online_mobile/utility/app_constants.dart';

class AuthServices extends ChangeNotifier {
  UserModel user = UserModel();

  Future<bool> login({nrp: String, password: String}) async {
    final response = await http.post(AppConstants.BASE_URL + 'login',
        body: {"nrp": "${nrp}", "password": "${password}"});
    if (response.statusCode == 200) {
      List decoded = json.decode(response.body);
      decoded.map((e) => this.user = UserModel.fromJson(e)).toList();
      return true;
      // notifyListeners();
    } else {
      return false;
      // notifyListeners();
    }
  }
}
