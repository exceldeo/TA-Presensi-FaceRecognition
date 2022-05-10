import 'package:presensi_online_mobile/data/model/contact_model.dart';
import 'package:presensi_online_mobile/data/repository/contact_repo.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  final ContactRepo contactRepo;
  ContactProvider({@required this.contactRepo});

  List<ContactModel> getContactList() {
    return contactRepo.getContactList();
  }
}
