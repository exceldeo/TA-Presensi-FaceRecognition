import 'package:presensi_online_mobile/data/model/user_model.dart';
import 'package:presensi_online_mobile/data/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final UserRepo userRepo;
  UserProvider({@required this.userRepo});

  UserModel user;
  bool loadingStateGetUser = true;

  Future<bool> authLogin({nrp: String, password: String}) async {
    Map<String, dynamic> value =
        await userRepo.authLogin(nrp: "${nrp}", password: "${password}");
    if (value["status"] == "success") {
      user = UserModel.fromJson(value["data"]);
      return true;
    } else {
      return false;
    }
  }

  UserModel getUser() {
    if (user != null) {
      loadingStateGetUser = false;
      return user;
    }
  }
}
