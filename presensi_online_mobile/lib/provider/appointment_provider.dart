import 'package:presensi_online_mobile/data/model/appointment_model.dart';
import 'package:presensi_online_mobile/data/repository/appointment_repo.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  final AppointmentRepo appointmentRepo;

  AppointmentProvider({@required this.appointmentRepo});

  List<AppointmentModel> getAppointmentList() {
    return appointmentRepo.getAppointmentList();
  }
}
