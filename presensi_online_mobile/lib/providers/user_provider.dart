import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:presensi_online_mobile/models/user.dart';
import 'dart:async';
import 'dart:convert';

import 'package:presensi_online_mobile/utility/app_constants.dart';
import 'package:presensi_online_mobile/utility/user_preference.dart';

enum AuthStatus { NotLoggedIn, LoggedIn, Authenticating, LoggedOut }

class UserProvider with ChangeNotifier {
  AuthStatus _loggedInStatus = AuthStatus.NotLoggedIn;

  AuthStatus get loggedInStatus => _loggedInStatus;

  User _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    var result;

    final user = await UserPreferences().getUser();
    final userNrp = user.nrp;

    Response response = await get(
      AppConstants.BASE_URL + "${userNrp}/mahasiswa",
    );

    if (response.statusCode == 200) {
      var responseData = Map<String, dynamic>.from(json.decode(response.body));
      _user = User.fromJson(responseData["data"]);

      notifyListeners();
      result = {
        'status': true,
      };
    } else {
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }

    print(result);
    return result;
  }

  Future<Map<String, dynamic>> login({nrp: String, password: String}) async {
    var result;

    // final Map<String, dynamic> loginData = {'nrp': nrp, 'password': password};

    _loggedInStatus = AuthStatus.Authenticating;
    notifyListeners();

    Response response = await post(
      AppConstants.BASE_URL + "login",
      body: {'nrp': nrp, 'password': password},
    );

    if (response.statusCode == 200) {
      var responseData = Map<String, dynamic>.from(json.decode(response.body));
      var authUser = User.fromJson(responseData["data"]);
      this.setUser(authUser);
      UserPreferences().saveUser(authUser);

      _loggedInStatus = AuthStatus.LoggedIn;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'user': authUser,
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      _loggedInStatus = AuthStatus.NotLoggedIn;
      notifyListeners();

      result = {
        'status': false,
        'message': responseData['message'],
      };
    }

    // print(result);
    return result;
  }

  Future<Map<String, dynamic>> logout() async {
    var result;
    UserPreferences().removeUser();

    result = {'status': true};
    print(result);

    return result;
  }

  Future<String> getNamaUser() async {
    var result;

    final user = await UserPreferences().getUser();
    final userNama = user.namaMahasiswa;

    return userNama;
  }
}
