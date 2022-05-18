class JadwalDetail {
  String hari;
  String jamMulai;
  String namaDosen;
  String kodeMatakuliah;
  String namaMatakuliah;
  String namaKelas;
  int idPresensiMahasiswa;

  JadwalDetail(
      {this.jamMulai,
      this.namaDosen,
      this.kodeMatakuliah,
      this.namaMatakuliah,
      this.namaKelas,
      this.idPresensiMahasiswa});

  JadwalDetail.fromJson(Map<String, dynamic> json) {
    hari = json['hari'];
    jamMulai = json['jam_mulai'];
    namaDosen = json['nama_dosen'];
    kodeMatakuliah = json['kode_matakuliah'];
    namaMatakuliah = json['nama_matakuliah'];
    namaKelas = json['nama_kelas'];
    idPresensiMahasiswa = json['id_presensi_mahasiswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hari'] = this.hari;
    data['jam_mulai'] = this.jamMulai;
    data['nama_dosen'] = this.namaDosen;
    data['kode_matakuliah'] = this.kodeMatakuliah;
    data['nama_matakuliah'] = this.namaMatakuliah;
    data['nama_kelas'] = this.namaKelas;
    data['id_presensi_mahasiswa'] = this.idPresensiMahasiswa;
    return data;
  }
}
