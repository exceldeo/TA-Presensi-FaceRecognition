class UserModel {
  int nrp;
  String namaMahasiswa;
  String password;
  String tahunMasuk;
  String email;
  String departement;

  UserModel(
      {this.nrp,
      this.namaMahasiswa,
      this.password,
      this.tahunMasuk,
      this.email,
      this.departement});

  UserModel.fromJson(Map<String, dynamic> json) {
    nrp = json['nrp'];
    namaMahasiswa = json['nama_mahasiswa'];
    password = json['password'];
    tahunMasuk = json['tahun_masuk'];
    email = json['email'];
    departement = json['departement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nrp'] = this.nrp;
    data['nama_mahasiswa'] = this.namaMahasiswa;
    data['password'] = this.password;
    data['tahun_masuk'] = this.tahunMasuk;
    data['email'] = this.email;
    data['departement'] = this.departement;
    return data;
  }
}
