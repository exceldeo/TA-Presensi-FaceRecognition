class User {
  int nrp;
  String namaMahasiswa;
  String password;
  String tahunMasuk;
  String email;
  String departement;
  String imgPath;
  int isVerifikasi;

  User(
      {this.nrp,
      this.namaMahasiswa,
      this.password,
      this.tahunMasuk,
      this.email,
      this.departement,
      this.imgPath,
      this.isVerifikasi});

  User.fromJson(Map<String, dynamic> json) {
    nrp = json['nrp'];
    namaMahasiswa = json['nama_mahasiswa'];
    password = json['password'];
    tahunMasuk = json['tahun_masuk'];
    email = json['email'];
    departement = json['departement'];
    imgPath = json['img_path'];
    isVerifikasi = json['is_verifikasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nrp'] = this.nrp;
    data['nama_mahasiswa'] = this.namaMahasiswa;
    data['password'] = this.password;
    data['tahun_masuk'] = this.tahunMasuk;
    data['email'] = this.email;
    data['departement'] = this.departement;
    data['img_path'] = this.imgPath;
    data['is_verifikasi'] = this.isVerifikasi;
    return data;
  }
}
