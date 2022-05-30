import 'package:presensi_online_mobile/models/user.dart';
import 'package:presensi_online_mobile/models/userPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('namaMahasiswa', user.namaMahasiswa);
    prefs.setString('nrp', user.nrp);
    return true;
  }

  Future<UserPreferenceModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String nrp = prefs.getString('nrp');
    String namaMahasiswa = prefs.getString('namaMahasiswa');

    return UserPreferenceModel(nrp: nrp, namaMahasiswa: namaMahasiswa);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('nrp');
    prefs.remove('namaMahasiswa');
  }
}
