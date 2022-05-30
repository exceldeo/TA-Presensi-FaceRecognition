class UserPreferenceModel {
  String nrp;
  String namaMahasiswa;

  UserPreferenceModel({this.nrp, this.namaMahasiswa});

  UserPreferenceModel.fromJson(Map<String, dynamic> json) {
    nrp = json['nrp'];
    namaMahasiswa = json['nama_mahasiswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nrp'] = this.nrp;
    data['nama_mahasiswa'] = this.namaMahasiswa;
    return data;
  }
}
