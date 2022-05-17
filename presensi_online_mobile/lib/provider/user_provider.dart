import 'package:presensi_online_mobile/data/model/user_model.dart';
import 'package:presensi_online_mobile/data/repository/user_repo.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserRepo userRepo;
  UserProvider({@required this.userRepo});

  UserModel user;

  Future<void> authLogin({nrp: String, password: String}) async {
    await userRepo
        .authLogin(nrp: "${nrp}", password: "${password}")
        .then((value) {
      user = value.response;
      // print(user.namaMahasiswa);
      // notifyListeners();
    }).catchError((e) {
      print(e);
      // notifyListeners();
    });
  }
}
