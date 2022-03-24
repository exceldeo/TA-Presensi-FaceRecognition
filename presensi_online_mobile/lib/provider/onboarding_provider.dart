import 'package:presensi_online_mobile/data/model/onboarding_model.dart';
import 'package:presensi_online_mobile/data/repository/onboarding_repo.dart';
import 'package:flutter/material.dart';

class OnBoardingProvider with ChangeNotifier {
  final OnBoardingRepo onBoardingRepo;
  OnBoardingProvider({@required this.onBoardingRepo});

  List<OnBoardingModel> getOnBoardingList() {
    return onBoardingRepo.getOnboardingList;
  }
}
